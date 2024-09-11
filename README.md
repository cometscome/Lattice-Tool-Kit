LTK is a collection of fundamental and essential codes for lattice QCD simulations, which has been developped by Dr. Atsushi Nakamura.

Numerical simulation is a tool for the research, and the lattice QCD is a tool for hadron physics. He wish many researchers employ the lattice QCD as a useful tool.

But it takes a lot of time and energy to construct the lattice QCD code from scratch. A library form is not appropriate when one wants to perform a new calculation based on a new idea. Then I decided to provide the lattice QCD code as a Tool Kit. You can use any code here as a building block to realize a program for your purpose.

The copyright is GNU GPL(General Public License). 

# How to use 
To use the HMC simulation, the procedure is as follows.
```
cd HMCwithClover
sh paraset
```
Then, you can see 
```fortran
Choose 1 or 2:
1 for HMC with Wilson gauge action
2 for HMC with 1x1+1x2 improved gauge action
```
If you want to use Wilson gauge action, choose 1. 
Now, the lattice parameter is written in ```INCLUDE/para_geometry```
```
      INTEGER NX,  NY,  NZ,  NT,  NV
      INTEGER NXH, NYH, NZH, NTH, NVH
      INTEGER NBUSH, NDW

      parameter( NX=4, NY=4, NZ=4, NT=4 )
      parameter( NV=NX*NY*NZ*NT, NVH=NV/2 )
      parameter( NXH=NX/2, NYH=NY/2, NZH=NZ/2, NTH=NT/2 )
      parameter( NBUSH=1 )       
      parameter( NDW=1 )        

! NX, NY, NZ, NT     : Lattice size
! NBUSH              : No. of Bush = Even/Odd of Hypercube * No. of links 
!                      on a Hyper-cube
! NDW                : Width of the fringes.  1 or 2
! NXH, NYX, NZH, NTH : Size of Hyper cube coordinates

!  Quench update with Wilson gauge action     NBUSH=2, NDW=1
!                with 1x1 + 1x2 gauge action  NBUSH=32, NDW=2
!  Hybrid MC     with Wilson gauge action     NBUSH=1, NDW=1
!                with 1x1 + 1x2 gauge action  NBUSH=1, NDW=2
```

```
cd ..
mkdir build
cd build
cmake ..
```
Then, you can find ```a.out```. 
The parameter is written in ```HMCwithClover/input```. 
```
1.90d0     1.90d0         beta, betamd
0.141139d0  1.d0         hop,  r (Hopping parametger, Wilson term)
.true.                   Clover term
(0.0d0,0.0d0)            cmu (Chemical potential)
1                        istart (1:Cold, 2:Hot, 3:File)
001       004            ntraj0, ntraj1 
1.d0                     gamma_G
10     0.02d0            nstep, dtau
.true.                   fermions
0                        flagMD
```

So, you can do the HMC like 
```
./a.out < ../HMCwithClover/input
```