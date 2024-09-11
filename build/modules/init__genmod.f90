        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INIT__genmod
          INTERFACE 
            SUBROUTINE INIT(U,ISTART,NDELAY)
              USE FIELD_G
              TYPE (G_FIELD0) :: U(4)
              INTEGER(KIND=4) :: ISTART
              INTEGER(KIND=4) :: NDELAY
            END SUBROUTINE INIT
          END INTERFACE 
        END MODULE INIT__genmod
