all:
	gcc -o cholesky cholesky.c -lm
	gcc -o cholesky_inv cholesky_inv.c -lm
	gcc -o lu lu.c -lm
	gcc -o lu_inv lu_inv.c -lm

runCholesky:
	./cholesky 4

runCholesky_inv:
	./cholesky_inv 5

runLU:
	./lu 5

runLU_inv:
	./lu_inv 4
