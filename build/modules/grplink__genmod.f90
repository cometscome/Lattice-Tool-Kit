        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GRPLINK__genmod
          INTERFACE 
            SUBROUTINE GRPLINK(T,X,IFLAG,NV)
              USE HMC_MOD
              TYPE (A_FIELD) :: T
              TYPE (G_FIELD1) :: X
              INTEGER(KIND=4) :: IFLAG
              INTEGER(KIND=4) :: NV
            END SUBROUTINE GRPLINK
          END INTERFACE 
        END MODULE GRPLINK__genmod
