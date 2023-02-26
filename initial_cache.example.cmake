set(CMAKE_INSTALL_PREFIX "$ENV{AIMS_HOME}" CACHE STRING "")

###############
# Basic Flags #
###############
set(CMAKE_Fortran_COMPILER mpiifort CACHE STRING "")
set(CMAKE_Fortran_FLAGS "-O3 -ip -fp-model precise" CACHE STRING "")
set(Fortran_MIN_FLAGS "-O0 -fp-model precise" CACHE STRING "")

###############
# C,C++ Flags #
###############
set(CMAKE_C_COMPILER icc CACHE STRING "")
set(CMAKE_C_FLAGS "-O3 -ip -fp-model precise -std=gnu99" CACHE STRING "")

###############
#- Libraries  #
###############
set(INC_PATHS "$ENV{GX_ROOT}/install/include/modules" CACHE STRING "")
set(LIB_PATHS "$ENV{MKLROOT}/lib/intel64" "$ENV{GX_ROOT}/install/lib" CACHE STRING "")
set(LIBS "mkl_scalapack_lp64 mkl_blacs_intelmpi_lp64 mkl_intel_lp64 mkl_sequential mkl_core gx_minimax GXCommon" CACHE STRING "")
set(USE_GREENX ON CACHE BOOL "")
set(USE_SCALAPACK ON CACHE BOOL "")
