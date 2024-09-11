        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ALGBLINK__genmod
          INTERFACE 
            SUBROUTINE ALGBLINK(X,C,NV)
              USE HMC_MOD
              USE FIELD_G
              TYPE (G_FIELD1) :: X
              TYPE (A_FIELD) :: C
              INTEGER(KIND=4) :: NV
            END SUBROUTINE ALGBLINK
          END INTERFACE 
        END MODULE ALGBLINK__genmod
