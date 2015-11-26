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
        mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/d2b
d2a:
        mpicc mpideadlock2b.c -o /shared/d2b
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
~                                                                      
-- INSERT --                                         46,36-43      Bot
