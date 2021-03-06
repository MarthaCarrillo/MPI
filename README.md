# MPI
MPI ("Message Passing Interface", Interfaz de Paso de Mensajes)

####Este repositorio contiene las actividades y preguntas correspondientes al tema MPI y los videos relacionados con el tema.
####Videos: 
https://docs.google.com/a/correounivalle.edu.co/document/d/1R5DccCSAEHOsIRVusPOfbkNLh64VvI4JtwSk2FqxUyE/edit?usp=sharing 

##Actividad 1 - Ejercicio Comunicación uno a uno
####Archivo: mpi1a1.c
Este programa es capaz de correr en un cluster computacional y ejecuta las instrucciones de paso de mensajes uno a uno. Se envía un mensaje que contiene un único carácter, el cual es recibido, pasado a mayúsculas y enviado de vuelta.
####Código:
https://github.com/MarthaCarrillo/MPI/blob/master/mpi1a1.c

##Actividad 2 - Preguntas Deadlocks
En esta sección se contestarán preguntas relacionadas con la lectura MPIDeadlocks
####Lectura:
https://drive.google.com/a/correounivalle.edu.co/file/d/0B7n65I8SStKXMHU5NHA3VWJzN0k/view

Ejecución de la página 234:

	MPI_Comm_rank (comm, &my_rank);
	if (my_rank == 0) {
		MPI_Recv (recvbuf, count, MPI_INT, 1, tag, comm, &status);
		MPI_Send (sendbuf, count, MPI_INT, 1, tag, comm);
	}
	else if (my_rank == 1) { 
		MPI_Recv (recvbuf, count, MPI_INT, 0, tag, comm, &status);
		MPI_Send (sendbuf, count, MPI_INT, 0, tag, comm);
 	}


### 1. Cuando la ejecución anterior no causa un deadlock? (p. 235)
R/ La ejecución anterior no causa un cuando recvbuf y sendbuf son diferentes en los dos procesos.

	MPI_Comm_rank (comm, &my_rank);
	if (my_rank == 0) {
		MPI_Recv (recvbuf1, count, MPI_INT, 1, tag, comm, &status);
		MPI_Send (sendbuf1, count, MPI_INT, 1, tag, comm);
	}
	else if (my_rank == 1) {
		MPI_Recv (recvbuf2, count, MPI_INT, 0, tag, comm, &status);
		MPI_Send (sendbuf2, count, MPI_INT, 0, tag, comm);
	}

### 2. Qué segura aplicación OpenMPI significa esto? (p. 235)
R/ La aplicación más segura, explicada en la lectura es en la que, mientras uno envía el otro recibe, y viceversa. Todo radica en el orden de la recepción y envío de los mensajes.

	MPI_Comm_rank (comm, &my_rank);
	if (my_rank == 0) {
		MPI_Send (sendbuf, count, MPI_INT, 1, tag, comm);
		MPI_Recv (recvbuf, count, MPI_INT, 1, tag, comm, &status);
	}
	else if (my_rank == 1) {
		MPI_Recv (recvbuf, count, MPI_INT, 0, tag, comm, &status);
		MPI_Send (sendbuf, count, MPI_INT, 0, tag, comm);
 	}

### 3. ¿Qué beneficios trae la función MPI_Sendrecv ()? (p. 237)
R/ La función MPI_Sendrecv() tiene como beneficios para el programador, el no tener que preocuparse por el orden de las operaciones de envío y recepción. El sistema de ejecución de MPI garantiza que se está libre de deadlock, incluso para el caso en el que no se utiliza buffers internos del sistema.

### 4. Escriba un programa para validar el beneficio proporcionado por la función MPI_Sendrecv()?
####Archivo: mpideadlock2a.c

##Actividad 3 - Ejercicios Deadlocks
#####Escribir programas en MPI que validen la aparición de un deadlock de acuerdo a los segmentos de código en las diapositiva 41, 42.

####Segmento de código diapositiva 41
	MPI_Comm_rank (comm, &my_rank);
	if (my_rank == 0) {
		MPI_Recv (recvbuf, count, MPI_INT, 1, tag, comm, &status);
		MPI_Send (sendbuf, count, MPI_INT, 1, tag, comm);
	}
	else if (my_rank == 1) { 
		MPI_Recv (recvbuf, count, MPI_INT, 0, tag, comm, &status);
		MPI_Send (sendbuf, count, MPI_INT, 0, tag, comm);
 	}
####Archivo: mpideadlock1a.c
	
####Segmento de código diapositiva 42
	MPI_Comm_rank (comm, &my_rank);
	if (my_rank == 0) {
		MPI_Send (sendbuf, count, MPI_INT, 1, tag, comm);
		MPI_Recv (recvbuf, count, MPI_INT, 1, tag, comm, &status);
	}
	else if (my_rank == 1) { 
		MPI_Send (sendbuf, count, MPI_INT, 0, tag, comm);
		MPI_Recv (recvbuf, count, MPI_INT, 0, tag, comm, &status);
	}
####Archivo: mpideadlock1b.c

#####Modifique el segmento de código de la diapositiva 42 de modo que se utilice la función MPI_Sendrecv(). Validar que el programa no cae en un deadlock
####Archivo: mpideadlock2a.c

##Actividad 4 - Ejercicio propuesto comunicación colectiva

####Modifique el código del archivo mpiExample4.c de modo que
######Se reciba la suma total en el nodo cero 
######Se reciba el producto de multiplicar todas las sumas parciales en el nodo de mayor rango de el comunicador MPI_COMM_WORLD
####Archivo: mpicolectiva1.c

####Modifique el código del archivo mpiExample7.c de modo que se envie a todos los nodos en el comunicador MPI_COMM_WORLD 
######la suma calculada en el nodo raiz de este comunicador
####Archivo: mpicolectiva2.c
