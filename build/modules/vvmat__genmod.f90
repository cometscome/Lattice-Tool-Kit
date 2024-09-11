        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE VVMAT__genmod
          INTERFACE 
            SUBROUTINE VVMAT(V1,V2,VV,IFLAG)
              USE FIELD_G
              USE FIELD_F
              TYPE (F_FIELD), INTENT(IN) :: V1
              TYPE (F_FIELD), INTENT(IN) :: V2
              TYPE (G_FIELD1), INTENT(OUT) :: VV
              INTEGER(KIND=4) :: IFLAG
            END SUBROUTINE VVMAT
          END INTERFACE 
        END MODULE VVMAT__genmod
