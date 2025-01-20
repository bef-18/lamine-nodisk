# lamine-nodisk

# lamine-nodisk

Proof of concept for data transfer from a Fortran process to a Python process.

---

### Requirements

The application must be compiled with the same compiler as the Python interpreter being used.

---

### Compilation Instructions

#### Compile for CPU
```bash
mpif90 -O3 matrix_to_python.f90 -o matrix_to_python.out
```

#### Compile for GPU (only if you have a Python compiled using nvhpc):
```bash
mpif90 -O3 -acc -cuda -gpu=cc90,lineinfo -Minfo=all matrix_to_python.f90 -o matrix_to_python.out
```

#### Execution of the sending and receiving applications:
```bash
mpirun -np 1 ./matrix_to_python.out : -np 1 python receive_matrix.py
```
#### Modules used in MN5 accelerated partition:
```bash
module load intel/2024.0.1-sycl_cuda impi/2021.11 hdf5/1.14.1-2 mkl/2024.0 python/3.12.1
```