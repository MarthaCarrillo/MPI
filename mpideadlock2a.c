#include <stdio.h>
#include "mpi.h"

int main(int argc,char *argv[]){
	int my_size, my_rank, count=1, tag=1;
	int recvbuf, sendbuf = 1;
	MPI_Status status;
	

	MPI_Init(&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD, &my_size);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

	if (my_rank == 0) {
	  MPI_Sendrecv(&sendbuf, count, MPI_INT, 1, tag, &recvbuf, count, MPI_INT, 1, tag, MPI_COMM_WORLD, &status);
	  printf("\nHello MPI Message received from process %d: %c, process %d!", 1, recvbuf, my_rank);
	}
	else if (my_rank == 1) {
    	  MPI_Sendrecv(&sendbuf, count, MPI_INT, 0, tag, &recvbuf, count, MPI_INT, 0, tag, MPI_COMM_WORLD, &status);
    	  printf("\nHello MPI Message received from process %d: %c, process %d!", 0, recvbuf, my_rank);
	}
	MPI_Finalize();
}
