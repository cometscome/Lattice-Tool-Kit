        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FPREP3__genmod
          INTERFACE 
            SUBROUTINE FPREP3(NX,NY,NZ,NT,INN)
              INTEGER(KIND=4), INTENT(IN) :: NT
              INTEGER(KIND=4), INTENT(IN) :: NZ
              INTEGER(KIND=4), INTENT(IN) :: NY
              INTEGER(KIND=4), INTENT(IN) :: NX
              INTEGER(KIND=4), INTENT(OUT) :: INN(NX*NY*NZ*NT,4,2)
            END SUBROUTINE FPREP3
          END INTERFACE 
        END MODULE FPREP3__genmod
