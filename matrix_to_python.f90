program matrix_to_python
   use mpi
  implicit none

  ! Variables
  integer            :: rank, size, ierr
  integer, parameter :: M=1000, N=100
  integer            :: i, j
  real, allocatable  :: matrix(:,:)

   ! Initialize MPI
   call MPI_Init(ierr)
   call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
   call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)

  ! Allocate the matrix
  allocate(matrix(M, N))
  !$acc enter data create(matrix)

  !$acc kernels present(matrix)
  do i = 1, M
     do j = 1, N
        matrix(i, j) = 69.0
     end do
  end do
  !$acc end kernels

  !$acc update host(matrix)

   call MPI_Send(matrix, M*N, MPI_REAL, 1, 0, MPI_COMM_WORLD, ierr)
  
   call MPI_Finalize(ierr)
end program matrix_to_python