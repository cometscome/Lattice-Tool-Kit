        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SAVE_CONF__genmod
          INTERFACE 
            SUBROUTINE SAVE_CONF(U,BETA,NDELAY)
              USE FIELD_G
              TYPE (G_FIELD0), INTENT(IN) :: U(4)
              REAL(KIND=8), INTENT(IN) :: BETA
              INTEGER(KIND=4), INTENT(IN) :: NDELAY
            END SUBROUTINE SAVE_CONF
          END INTERFACE 
        END MODULE SAVE_CONF__genmod
