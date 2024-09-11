        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE Z2_RAN_F__genmod
          INTERFACE 
            FUNCTION Z2_RAN_F(IDUMY) RESULT(X)
              USE FIELD_F
              INTEGER(KIND=4), INTENT(IN) :: IDUMY
              TYPE (F_FIELD) :: X
            END FUNCTION Z2_RAN_F
          END INTERFACE 
        END MODULE Z2_RAN_F__genmod
