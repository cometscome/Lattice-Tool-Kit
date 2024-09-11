        !COMPILER-GENERATED INTERFACE MODULE: Wed Sep 11 15:28:50 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MKFMUNUTEST__genmod
          INTERFACE 
            SUBROUTINE MKFMUNUTEST(U,HOP,CSW)
              USE FIELD_G
              TYPE (G_FIELD0), INTENT(IN) :: U(4)
              REAL(KIND=8), INTENT(IN) :: HOP
              REAL(KIND=8), INTENT(IN) :: CSW
            END SUBROUTINE MKFMUNUTEST
          END INTERFACE 
        END MODULE MKFMUNUTEST__genmod
