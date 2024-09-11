        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE VXSIGXV__genmod
          INTERFACE 
            SUBROUTINE VXSIGXV(V1,V2,U,Z,TMP1,TMP2,MU,NU)
              USE HMC_MOD
              USE FIELD_F
              COMPLEX(KIND=8), INTENT(IN) :: V1(3,256,4)
              COMPLEX(KIND=8), INTENT(IN) :: V2(3,256,4)
              TYPE (G_FIELD1), INTENT(IN) :: U(8)
              TYPE (A_FIELD), INTENT(INOUT) :: Z
              COMPLEX(KIND=8), INTENT(INOUT) :: TMP1(3,256,4)
              COMPLEX(KIND=8), INTENT(INOUT) :: TMP2(3,256,4)
              INTEGER(KIND=4), INTENT(IN) :: MU
              INTEGER(KIND=4), INTENT(IN) :: NU
            END SUBROUTINE VXSIGXV
          END INTERFACE 
        END MODULE VXSIGXV__genmod
