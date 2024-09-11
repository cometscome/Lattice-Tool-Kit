        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TRLINK__genmod
          INTERFACE 
            SUBROUTINE TRLINK(U,S,N)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8), INTENT(IN) :: U(3,3,N)
              REAL(KIND=8), INTENT(OUT) :: S
            END SUBROUTINE TRLINK
          END INTERFACE 
        END MODULE TRLINK__genmod
