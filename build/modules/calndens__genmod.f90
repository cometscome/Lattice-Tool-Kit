        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:51 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CALNDENS__genmod
          INTERFACE 
            SUBROUTINE CALNDENS(RHO,CHIRHO,NNZ)
              COMPLEX(KIND=8), INTENT(OUT) :: RHO
              COMPLEX(KIND=8), INTENT(OUT) :: CHIRHO
              INTEGER(KIND=4), INTENT(IN) :: NNZ
            END SUBROUTINE CALNDENS
          END INTERFACE 
        END MODULE CALNDENS__genmod
