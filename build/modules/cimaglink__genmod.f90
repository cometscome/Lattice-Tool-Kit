        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CIMAGLINK__genmod
          INTERFACE 
            SUBROUTINE CIMAGLINK(X,Y,NV)
              INTEGER(KIND=4) :: NV
              COMPLEX(KIND=8) :: X(3,3,NV)
              COMPLEX(KIND=8) :: Y(3,3,NV)
            END SUBROUTINE CIMAGLINK
          END INTERFACE 
        END MODULE CIMAGLINK__genmod
