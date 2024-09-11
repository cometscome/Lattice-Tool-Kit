        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MEAS1ST__genmod
          INTERFACE 
            SUBROUTINE MEAS1ST(U,PLAQS,PLAQT)
              USE FIELD_G
              TYPE (G_FIELD0), INTENT(IN) :: U(4)
              REAL(KIND=8), INTENT(OUT) :: PLAQS
              REAL(KIND=8), INTENT(OUT) :: PLAQT
            END SUBROUTINE MEAS1ST
          END INTERFACE 
        END MODULE MEAS1ST__genmod
