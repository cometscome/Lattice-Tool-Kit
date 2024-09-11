        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RDPARAM__genmod
          INTERFACE 
            SUBROUTINE RDPARAM(BETA,BETAMD,CSW,HOP,R,CMU,GAMMA_G,DTAU,  &
     &ISTART,NTRAJ0,NTRAJ1,NSTEP,FERMIONS)
              REAL(KIND=8) :: BETA
              REAL(KIND=8) :: BETAMD
              REAL(KIND=8) :: CSW
              REAL(KIND=8) :: HOP
              REAL(KIND=8) :: R
              COMPLEX(KIND=8) :: CMU
              REAL(KIND=8) :: GAMMA_G
              REAL(KIND=8) :: DTAU
              INTEGER(KIND=4) :: ISTART
              INTEGER(KIND=4) :: NTRAJ0
              INTEGER(KIND=4) :: NTRAJ1
              INTEGER(KIND=4) :: NSTEP
              LOGICAL(KIND=4) :: FERMIONS
            END SUBROUTINE RDPARAM
          END INTERFACE 
        END MODULE RDPARAM__genmod
