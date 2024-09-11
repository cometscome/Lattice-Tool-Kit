        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ADDFMUNU__genmod
          INTERFACE 
            SUBROUTINE ADDFMUNU(FMUNU,V,NV)
              USE FIELD_G
              INTEGER(KIND=4) :: NV
              COMPLEX(KIND=8), INTENT(INOUT) :: FMUNU(3,3,NV)
              TYPE (G_FIELD1), INTENT(IN) :: V
            END SUBROUTINE ADDFMUNU
          END INTERFACE 
        END MODULE ADDFMUNU__genmod
