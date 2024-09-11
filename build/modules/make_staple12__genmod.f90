        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MAKE_STAPLE12__genmod
          INTERFACE 
            SUBROUTINE MAKE_STAPLE12(U,STAPLE,MU,NU)
              USE FIELD_G
              TYPE (G_FIELD0), INTENT(IN) :: U(4)
              TYPE (G_FIELD1), INTENT(OUT) :: STAPLE
              INTEGER(KIND=4), INTENT(IN) :: MU
              INTEGER(KIND=4), INTENT(IN) :: NU
            END SUBROUTINE MAKE_STAPLE12
          END INTERFACE 
        END MODULE MAKE_STAPLE12__genmod
