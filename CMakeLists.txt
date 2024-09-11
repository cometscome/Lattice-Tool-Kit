cmake_minimum_required(VERSION 3.10)
project(FortranProject LANGUAGES Fortran)

# Define source directories
set(MODULE_DIR "${CMAKE_SOURCE_DIR}/MODULE/")
set(LIBRARY_DIR "${CMAKE_SOURCE_DIR}/LIBRARY/")
set(INCLUDE_DIR "${CMAKE_SOURCE_DIR}/INCLUDE/")
set(FERMIONwithClover_DIR "${CMAKE_SOURCE_DIR}/FERMIONwithClover/")
set(HMCwithClover_DIR "${CMAKE_SOURCE_DIR}/HMCwithClover/")
set(GAUGE_DIR "${CMAKE_SOURCE_DIR}/GAUGE/")

# Specify the Fortran compiler
set(CMAKE_Fortran_COMPILER gfortran)

# Define include directories
include_directories(${INCLUDE_DIR})

set(SOURCES 
    ${MODULE_DIR}/g_module0.f
    ${MODULE_DIR}/f_module.f
    ${MODULE_DIR}/fpara_module.f
    ${HMCwithClover_DIR}/main.f
    ${HMCwithClover_DIR}/hmc_clover.f
    ${FERMIONwithClover_DIR}/CGwithClover.f
    ${FERMIONwithClover_DIR}/clover.f
    ${FERMIONwithClover_DIR}/propa.f
    ${LIBRARY_DIR}/su3.f
    ${LIBRARY_DIR}/su3_hmc.f
    ${LIBRARY_DIR}/rand.f
    ${LIBRARY_DIR}/boundary_fermi.f
    ${LIBRARY_DIR}/boundary_gauge.f
    ${LIBRARY_DIR}/lib_fermion.f
    ${LIBRARY_DIR}/initconf.f
    ${LIBRARY_DIR}/saveconf.f
    ${FERMIONwithClover_DIR}/measN.f
    ${MODULE_DIR}/hmc_module.f
    ${MODULE_DIR}/aniso_module.f
    ${MODULE_DIR}/debug1.f
    ${GAUGE_DIR}/meas1.f
    ${GAUGE_DIR}/meas2.f
    ${GAUGE_DIR}/update.f
)

# Add executable
add_executable(a.out 
    ${HMCwithClover_DIR}/hmc.f
    ${SOURCES}
)

# Add custom compilation flags if necessary (adjust as needed)
set_target_properties(a.out PROPERTIES Fortran_MODULE_DIRECTORY "${CMAKE_BINARY_DIR}/modules")

