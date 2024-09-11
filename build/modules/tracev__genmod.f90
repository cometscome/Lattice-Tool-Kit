        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TRACEV__genmod
          INTERFACE 
            SUBROUTINE TRACEV(U,V,S,IFLAG)
              USE FIELD_G
              TYPE (G_FIELD1) :: U
              TYPE (G_FIELD1) :: V
              REAL(KIND=8) :: S(256)
              INTEGER(KIND=4) :: IFLAG
            END SUBROUTINE TRACEV
          END INTERFACE 
        END MODULE TRACEV__genmod
