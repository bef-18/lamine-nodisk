program random_matrix_to_file
   use mpi
  implicit none

  ! Variables
  integer            :: rank, size, ierr
  integer, parameter :: M=1000, N=100
  integer            :: i, j
  real, allocatable  :: matrix(:,:)
  character(len=100) :: filename
  integer            :: unit_number

   ! Initialize MPI
   call MPI_Init(ierr)
   call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
   call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)

   write(filename, '("matrix-", I0, ".dat")') rank
   
  ! Allocate the matrix
  allocate(matrix(M, N))
  !$acc enter data create(matrix)

  !$acc kernels present(matrix)
  do i = 1, M
     do j = 1, N
        matrix(i, j) = rank
     end do
  end do
  !$acc end kernels

  !$acc update host(matrix)

  ! Open the file to write the matrix
  unit_number = 10  ! Using unit number 10 as an example
  open(unit=unit_number, file=filename, status='replace', action='write')

  ! Write the matrix to the file
  do i = 1, M
     write(unit_number, '(F10.5)', advance='no') (matrix(i, j), j = 1, N)
     write(unit_number, *)
  end do

  ! Close the file
  close(unit_number)

  ! Deallocate the matrix
  deallocate(matrix)

  print *, 'Random matrix written to ', trim(filename)

   call MPI_Finalize(ierr)
end program random_matrix_to_file