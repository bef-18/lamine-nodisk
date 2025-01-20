from mpi4py import MPI
import numpy as np

# Initialize MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

# Define the dimensions of the matrix (must match Fortran)
M, N = 1000, 100
if rank == 1:
    # Allocate space to receive the matrix
    matrix = np.empty((M, N), dtype='float32')  # Match Fortran's real type
    comm.Recv(matrix, source=0, tag=0)         # Receive from Fortran (rank o)
    print("Received matrix from Fortran:")
    print(matrix)
else:
    # Rank 1 will communicate with Fortran
    pass
