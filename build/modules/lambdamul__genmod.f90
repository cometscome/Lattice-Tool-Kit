        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LAMBDAMUL__genmod
          INTERFACE 
            SUBROUTINE LAMBDAMUL(A,B,K)
              USE FIELD_G
              TYPE (G_FIELD1), INTENT(IN) :: A
              TYPE (G_FIELD1), INTENT(OUT) :: B
              INTEGER(KIND=4), INTENT(IN) :: K
            END SUBROUTINE LAMBDAMUL
          END INTERFACE 
        END MODULE LAMBDAMUL__genmod
