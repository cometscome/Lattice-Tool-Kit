LTK is a collection of fundamental and essential codes for lattice QCD simulations, which has been developped by Dr. Atsushi Nakamura.

Numerical simulation is a tool for the research, and the lattice QCD is a tool for hadron physics. He wish many researchers employ the lattice QCD as a useful tool.

But it takes a lot of time and energy to construct the lattice QCD code from scratch. A library form is not appropriate when one wants to perform a new calculation based on a new idea. Then I decided to provide the lattice QCD code as a Tool Kit. You can use any code here as a building block to realize a program for your purpose.

The copyright is GNU GPL(General Public License). 

# Modified version
I made CMakeLists.txt to use cmake. 
I revised codes. 

# Changes in this fork (2026-08-14)

This fork fixes several problems that prevented the Wilson HMC program
from running reliably with optimization and with Intel oneAPI Fortran.

* The random-number initialization no longer relies on signed 32-bit
  integer overflow.  The original overflow-dependent statements are
  retained as comments, and the replacement uses 64-bit arithmetic with
  an explicit modulo `2^32` wraparound.  This fixes invalid random states,
  NaNs, and CG non-convergence observed with optimization above `-O0`.
* Large fermion work fields and field-valued operator results use explicit
  allocatable storage.  In addition, `wxvect` now writes to a caller-owned
  output field instead of returning a lattice-sized function temporary.
  These changes avoid overflowing the default process stack without
  requiring the Intel `-heap-arrays` option or an unlimited stack.
* The Metropolis test calls the external `ranf` routine with its required
  dummy argument.  This prevents Intel Fortran from confusing the call
  with its `RANF` intrinsic and producing an invalid accept/reject result.
* The serial CG diagnostic rank is initialized to zero instead of printing
  an undefined value.
* CMake recognizes both the classic Intel compiler ID (`Intel`) and the
  oneAPI LLVM compiler ID (`IntelLLVM`).

The clover-free Wilson HMC configuration was tested at `-O3` with
gfortran 11.5.0 and Intel oneAPI ifx 2025.1.1.  The normal `4x4x4x4`
input completed four trajectories with both compilers.  Lattice-size
checks also covered `6x4x4x4`, `4x6x4x4`, `8x6x4x4`, and `12x8x4x4`.
The `12x8x4x4` case reproduced an ifx stack failure before the temporary-
storage fix and completed successfully afterward with the default 8 MiB
stack and without `-heap-arrays`.  GNU bounds checking found no Nx/Ny
indexing errors in these cases.  These size checks were performed on
temporary copies; the repository default remains `4x4x4x4`.

Example optimized builds are:

```sh
cmake -S . -B build-gfortran \
  -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_BUILD_TYPE=Release
cmake --build build-gfortran

cmake -S . -B build-ifx \
  -DCMAKE_Fortran_COMPILER=ifx -DCMAKE_BUILD_TYPE=Release
cmake --build build-ifx
```

For ifx, initialize the oneAPI environment (for example by sourcing
`setvars.sh`) before configuring and running the executable.  The
clover-free validation used `.false.` for `Clover term` on the third line
of `HMCwithClover/input`.

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

*note* This fork has been tested with gfortran 11.5.0 and Intel oneAPI
ifx 2025.1.1.  Other compiler versions have not yet been validated.
