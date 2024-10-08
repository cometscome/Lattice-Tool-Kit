c--------------------------------------------------------------c
      program hybridmc
c--------------------------------------------------------------c
c     performs hybrid Monte Carlo for SU(3) with Wilson fermions
c     intended to be generic by switching libraries
c     here pure gauge version
c--------------------------------------------------------------c
      USE field_g
      USE hmc_mod
      USE fpara
      USE aniso
      include '../INCLUDE/para_geometry'
C     include '../INCLUDE/para.h'

      TYPE(g_field0) u(4)
      common/ config/ u

      REAL*8  plaq,plaqsum
      COMPLEX*16  Pol(3,3,NX,NY,NZ), avePol
      myrank = 0


c     ...............................................

c     *****   Read input parameters   *****
      call  rdparam
     &      (beta,betamd,Csw,hop,r,cmu,gamma_G,dtau,istart,
     &       ntraj0,ntraj1,nstep,fermions)

c     *****  Set hopping parameters with chemical potential
      do mu = 1, 3
        hopp(mu) = hop
        hopm(mu) = hop
      enddo

      hopp(4) = exp(+cmu)*hop
      hopm(4) = exp(-cmu)*hop

c     ...  Make Gamma Matrices
      caLl mk_gamma

c     *****   CG Stopping condition
      eps = 1.d-8
      imax = 1000


c     *****   starting condition   *****
      call  init(u,istart,ndelay)

      call  meas1(u,plaq)
      write(*,*) "Plaq at the begining : ", myrank,plaq

c     *****   Hybrid Monte Carlo sweeps (Trajectories)  *****
      SWEEP0 : do n0 = 1, ntraj0

         SWEEP1 : do n1 = 1, ntraj1

           call  update
           call  meas1(u,plaq)
           write(*,*) "Plaq : ", plaq
           call CalPol(u,Pol,avePol)
           write(*,*) "Pol : ", avePol

         enddo SWEEP1

      enddo SWEEP0

c     *****  Save configuration *****
      call  save_conf(u,beta,ndelay) 

      stop
      end

c--------------------------------------------------------------c
      subroutine update
c--------------------------------------------------------------c
c     performs hybrid Monte Carlo
c--------------------------------------------------------------c

      call md
      call metrop

      return
      end

c--------------------------------------------------------------c
      subroutine md
c--------------------------------------------------------------c
c     performs molecular dynamics over one trajectory
c--------------------------------------------------------------c
      USE field_g
      USE hmc_mod
      USE fpara
      include '../INCLUDE/para_geometry'

c     ...  Molecular Dynamics Initialization  ...
         call mdinit

            do istep = 1, nstep 
              call stepu(0.5d0)
              call stepp(1.0d0)
              if (fermions) call steppf(1.0d0)
              call stepu(0.5d0)
            enddo

c     ...  Solve W^dagger*eta = phi

*     if(fermions) call cg0(eta,phi,eps,imax,2)
      if(fermions) call cg0(eta,phi,2)

      return
      end

c--------------------------------------------------------------c
      subroutine mdinit
c--------------------------------------------------------------c
c     initializes momenta and pseudo-fermion fields
c     saves link configuration
c--------------------------------------------------------------c
      USE debug1
      USE hmc_mod 
      USE field_g
      USE fpara
      include '../INCLUDE/para_geometry'
 
      TYPE(g_field0) u(4)
      TYPE(f_field)  wxvect, gauss_ran_f
      common/ config/ u

      REAL*8 pwork(NDFALG,NV), fwork(2,3,NV)

      parameter( NTRACE=3 )

      REAL*8 UDUMMY(18,4,NV), PDUMMY(6,4,NV), ETADUMMY(6,4,NV)

      fac = - dtau * betamd / float(2 * NTRACE) ! "2" is necessary ???

      do mu = 1, 4
         usave(mu) = u(mu)
      enddo

      do mu = 1, 4

         call gaussian(NV*NDFALG,pwork,1.d0)

         do k = 1, NDFALG
         do i = 1, NV
           p(mu)%a(k,i) = pwork(k,i)
         enddo
         enddo

*     WRITE(*,*) "mu, p= ", mu, p(mu)%a(1,1), p(mu)%a(NDFALG,NV)
      enddo

      if (fermions) then

        eta = gauss_ran_f(idumy)
        call set_wing_f1(eta)

         IF( abs(Csw) > 0.001 ) THEN
         CALL MKFmunu(U,hop,Csw)
         ENDIF


        phi = wxvect(eta,3)   ! phi = W_adj*eta
        call set_wing_f1(phi)

      end if

      call action(eold,eymold)

      return
      end

c--------------------------------------------------------------c
      subroutine action(e,eym)
c--------------------------------------------------------------c
c     calculates total action
c--------------------------------------------------------------c
      USE hmc_mod
      include '../INCLUDE/para_geometry'
      parameter( NTRACE=3 )
      real*8  e, eym
      real*8  ek, epf

      call ymaction(eym)
      ek = (p(1)*p(1)) + (p(2)*p(2)) + (p(3)*p(3)) + (p(4)*p(4)) 
      ek = 0.5d0 * ek
      e = ek - eym * beta / float(NTRACE) 

      if (fermions)  e = e + (eta*eta)

*     WRITE(*,'(a,5(2x,e15.7))') " 0.5*ek,-eym*beta/N, eta**2:",
*    &            0.5d0*ek, -eym*beta/float(NTRACE),(eta*eta)
      return
      end

c--------------------------------------------------------------c
      subroutine ymaction(s)
c--------------------------------------------------------------c
C     computes total action for whole lattice
c--------------------------------------------------------------c
      USE field_g
      include '../INCLUDE/para_geometry'
      parameter( NTRACE=3 )
      TYPE(g_field0) u(4)
      TYPE(g_field1) staple, temp1
      common/ config/ u

      REAL*8 s,ssum,trace(NV)

      s = 0.d0

      Direction: do mu = 1, 4

         call make_staple1(u,staple,mu)  ! Staple for Wilson action

         temp1 = u(mu)  
         call tracev (temp1,staple,trace,0)

         Site : do i = 1,NV
           s = s + trace(i)

 	 enddo Site

      enddo Direction

      s = 0.5d0 * s

*     print *,"Plaquette : ", s / float(NV * (3*2) * ntrace)

      return
      end

c--------------------------------------------------------------c
      subroutine ekin(ek)
c--------------------------------------------------------------c
c     calculates kinetic energy 
c--------------------------------------------------------------c
      USE hmc_mod 
      include '../INCLUDE/para_geometry'
      real*8  ek

      ek = 0.d0
      do mu = 1, 4
         ek = ek + p(mu)*p(mu)
      enddo

      ek = ek * 0.5d0

      return
      end

c--------------------------------------------------------------c
      subroutine metrop
c--------------------------------------------------------------c
c     performs global accept/reject step
c--------------------------------------------------------------c
      USE field_g
      USE hmc_mod 
      include '../INCLUDE/para_geometry'

      TYPE(g_field0) u(4)
      common/ config/ u

      LOGICAL accept

      call action(enew,eymnew)
      accept = exp(eold - enew) .ge. ranf()

      WRITE(*,'(a,3(e15.7,2x),l2)') "Eold,Enew,Diff,accept: ",
     &            eold, enew, eold-enew, accept

      if (accept) then
        iaccept = iaccept + 1
      else
        do mu = 1, 4
          u(mu) = usave(mu)
        enddo
      end if

      return
      end

c----------------------------------------------------------------------c
      subroutine rdparam
     &           (beta,betamd,Csw,hop,r,cmu,gamma_G,dtau,istart,
     &            ntraj0,ntraj1,nstep,fermions)
c----------------------------------------------------------------------c
*     Subrouitine to read parameters
c----------------------------------------------------------------------c
      include '../INCLUDE/para_geometry'   
C     include '../INCLUDE/para.h'
      REAL*8 beta, betamd, gamma_G, dtau
      REAL*8 Csw, hop, r
      COMPLEX*16 cmu
      LOGICAL fermions, clover

C     if (myrank == 0) then  
        read(*,*) beta, betamd  
        read(*,*) hop,  r  
        read(*,*) clover
        read(*,*) cmu
        read(*,*) istart
        read(*,*) ntraj0, ntraj1
        read(*,*) gamma_G
        read(*,*) nstep, dtau 
        read(*,*) fermions

        IF(clover) THEN
*          CALL CswEstimate2(beta,Csw)
           Csw = 1.5612d0
        ELSE
           Csw = 0.0d0
        ENDIF

C     end if


C     IF (myrank==0) THEN
        write(*,'(a,f5.2,2x,f5.2)') "beta, betamd : ", beta, betamd
        write(*,'(a,f7.4,2x,f5.1)') "hop, r : ", hop, r
        write(*,'(a,f7.4)') "Csw : ", Csw 
        write(*,'(a,f7.4,2x,f7.4)') "Chemical Potential : ", cmu 
        write(*,'(a,i2)') "istart : ", istart
        write(*,'(a,2i5)') "ntraj0,ntraj1 : ", ntraj0,ntraj1
        write(*,'(a,f7.3)') "gamma_G : ", gamma_G
        write(*,'(a,i3,2x,f8.4)') "nstep, dtau : ", nstep, dtau 
        write(*,*) "fermions : ", fermions
        write(*,'(a,4i3)') "Nx,Ny,Nz,Nt: ", NX,NY,NZ,NT
C     ENDIF

      IF(NBUSH.NE.1)  THEN
        write(*,*) "This is HMC program, and NBUSH must be 1"
        write(*,*) "But your NBUSH = ", NBUSH
        stop
      ENDIF

      IF(NDW==1)  THEN
        write(*,*) "Standard gauge action"
      ELSE IF(NDW==2)  THEN
        write(*,*) "Improved gauge action. NDW=",NDW
      ELSE
        write(*,*) "NDW is strange: ", NDW
        stop
      ENDIF
         
      RETURN
      END
