        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WXVECT__genmod
          INTERFACE 
            FUNCTION WXVECT(X,IFLAG)
              USE FIELD_F
              TYPE (F_FIELD), INTENT(IN) :: X
              INTEGER(KIND=4) :: IFLAG
              TYPE (F_FIELD) :: WXVECT
            END FUNCTION WXVECT
          END INTERFACE 
        END MODULE WXVECT__genmod
