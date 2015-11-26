run: compile
        mpirun -np 8 --hostfile machinefile /shared/openmpi_demo
compile:
        mpicc openmpi_demo.c -o /shared/openmpi_demo
clean:
        rm -rf /shared/openmpi_demo
ex1: example1
        mpirun -np 2 --hostfile machinefile /shared/ex1
example1:
        mpicc mpiExample1.c -o /shared/ex1
ex2: example2
        mpirun -np 8 --hostfile machinefile /shared/ex2
example2:
        mpicc mpiExample2.c -o /shared/ex2
ex3: example3
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/ex3
example3:
        mpicc mpiExample3.c -o /shared/ex3
ex4: example4
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 8 --hostfile machinefile /shared/ex4
example4:
        mpicc mpiExample4.c -o /shared/ex4
exd1a: d1a
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/d1a
d1a:
        mpicc mpideadlock1a.c -o /shared/d1a
exd1b: d1b
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/d1b
d1b:
        mpicc mpideadlock1b.c -o /shared/d1b
exd2a: d2a
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/d2a
d2a:
        mpicc mpideadlock2a.c -o /shared/d2a
exc1: colectiva1
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/colectiva1
colectiva1:
        mpicc colectiva1.c -o /shared/colectiva1
exc2: colectiva2
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/colectiva2
colectiva2:
        mpicc colectiva2.c -o /shared/colectiva2
ex5: example5
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 8 --hostfile machinefile /shared/ex5
example5:
        mpicc mpiExample5.c -o /shared/ex5
