        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:52 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SUBMAT__genmod
          INTERFACE 
            SUBROUTINE SUBMAT(X,C,N,K,ID)
              USE FIELD_G
              INTEGER(KIND=4) :: N
              TYPE (G_FIELD1) :: X
              REAL(KIND=8) :: C(4,N)
              INTEGER(KIND=4) :: K
              INTEGER(KIND=4) :: ID(N)
            END SUBROUTINE SUBMAT
          END INTERFACE 
        END MODULE SUBMAT__genmod
