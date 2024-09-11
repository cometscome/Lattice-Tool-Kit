        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CALPOL__genmod
          INTERFACE 
            SUBROUTINE CALPOL(U,POL,AVEPOL)
              USE FIELD_G
              TYPE (G_FIELD0), INTENT(IN) :: U(4)
              COMPLEX(KIND=8), INTENT(OUT) :: POL(3,3,4,4,4)
              COMPLEX(KIND=8), INTENT(OUT) :: AVEPOL
            END SUBROUTINE CALPOL
          END INTERFACE 
        END MODULE CALPOL__genmod
