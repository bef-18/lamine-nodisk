
#/gpfs/projects/bsc43/CODA/deps/mpi4py/build/lib.linux-x86_64-cpython-38
source ./coda_env_mn5.sh
source ./coda_python3.10.sh
export PYTHONPATH=$PYTHONPATH:mpi4py/build/lib.linux-x86_64-cpython-310 

mpif90 matrix_to_python.f90

mpirun -np 1 ./a.out : -np 1 python receive_matrix.py
