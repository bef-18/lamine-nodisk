#!/bin/bash
#
# CODA modules and dependencies for MN5

# 1. Modules for CODA in MN5
module purge
module load bsc
module load openmpi/4.1.5-gcc
#module load impi/2021.10.0
module load hdf5/1.10.11-gcc-ompi mkl/2021.4.0 sqlite3/3.41.0-gcc
module load szip/2.1.1-gcc 
#module load pnetcdf/1.12.3-gcc netcdf/c-4.9.2_fortran-4.6.1_cxx4-4.3.1_hdf5-1.14.1-2_pnetcdf-1.12.3-gcc 
module load metis/5.1.0-gcc parmetis/4.0.3-gcc
module load ucx/1.16.0-gcc

# 2. Basic dependencies
export CODA_DEPS="/gpfs/projects/bsc43/CODA/deps"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/Zoltan/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/GPI-2/install/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/CGNS/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/fmt/install/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/gempa/install/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/hdf5-1.10.11/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/netcdf-c-4.9.2/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/pnetcdf-1.12.3/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODA_DEPS}/parmetis-4.0.3/install/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${CODA_DEPS}/fmt/install/lib64/pkgconfig
#export PATH=$PATH:${CODA_DEPS}/hdf5-1.10.11/install/bin
export PATH=$PATH:${CODA_DEPS}/netcdf-c-4.9.2/install/bin
export PATH=$PATH:${CODA_DEPS}/pnetcdf-1.12.3/install/bin
export PATH=$PATH:${CODA_DEPS}/swig/install/bin
export PATH=$PATH:${CODA_DEPS}/doxygen/install/bin

# 3. Mesh directories (for testing)
export CODA_MESH_INPUT_DIRECTORY=${CODA_DEPS}/coda-ci-meshes

# 4. Compiler and flags
export CXX=mpicxx
export CXXFLAGS="-O3 -fno-finite-math-only -mavx2 -mavx512f -mavx512pf -march=sapphirerapids -Wall"
