        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DSCLOVER__genmod
          INTERFACE 
            SUBROUTINE DSCLOVER(MU,Z,U)
              USE FIELD_G
              USE HMC_MOD
              INTEGER(KIND=4), INTENT(IN) :: MU
              TYPE (A_FIELD), INTENT(OUT) :: Z
              TYPE (G_FIELD0), INTENT(IN) :: U(4)
            END SUBROUTINE DSCLOVER
          END INTERFACE 
        END MODULE DSCLOVER__genmod
