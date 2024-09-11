        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CAL_DFMUNU__genmod
          INTERFACE 
            SUBROUTINE CAL_DFMUNU(U,DFMUNU1,DFMUNU2,WORK1,WORK2,WORK3,  &
     &WORK4,TEMP1,TEMP2,TEMP3,TEMP4,MU,NU,IFLAG)
              USE FIELD_G
              TYPE (G_FIELD0), INTENT(IN) :: U(4)
              TYPE (G_FIELD1), INTENT(OUT) :: DFMUNU1(8)
              TYPE (G_FIELD1), INTENT(OUT) :: DFMUNU2(8)
              TYPE (G_FIELD1) :: WORK1
              TYPE (G_FIELD1) :: WORK2
              TYPE (G_FIELD1) :: WORK3
              TYPE (G_FIELD1) :: WORK4
              TYPE (G_FIELD1) :: TEMP1
              TYPE (G_FIELD1) :: TEMP2
              TYPE (G_FIELD1) :: TEMP3
              TYPE (G_FIELD1) :: TEMP4
              INTEGER(KIND=4), INTENT(IN) :: MU
              INTEGER(KIND=4), INTENT(IN) :: NU
              INTEGER(KIND=4), INTENT(IN) :: IFLAG
            END SUBROUTINE CAL_DFMUNU
          END INTERFACE 
        END MODULE CAL_DFMUNU__genmod
