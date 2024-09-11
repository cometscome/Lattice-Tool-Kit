        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:52 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ACCPTMET__genmod
          INTERFACE 
            SUBROUTINE ACCPTMET(UOLD,UTRY,EOLD,ETRY,IACCPT,NACCEPT)
              USE FIELD_G
              TYPE (G_FIELD1) :: UOLD
              TYPE (G_FIELD1) :: UTRY
              REAL(KIND=8) :: EOLD(256)
              REAL(KIND=8) :: ETRY(256)
              INTEGER(KIND=4) :: IACCPT(256)
              INTEGER(KIND=4) :: NACCEPT
            END SUBROUTINE ACCPTMET
          END INTERFACE 
        END MODULE ACCPTMET__genmod
