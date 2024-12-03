# Linear Numerical Algebra Project

This repository contains the implementations of algorithms for the course **Επιστημονικοί Υπολογισμοί (Αριθμητική Γραμμική Άλγεβρα, ΘΠ03)**.

## Course Overview

This course focuses on numerical methods in scientific computing, with a particular emphasis on linear algebra operations such as matrix decompositions, solving systems of equations, and eigenvalue problems. The projects in this repository demonstrate the application of various algorithms in these areas.

## Projects Overview

### Project 1: Cholesky Decomposition & LU Decomposition
- **Cholesky Decomposition**: This project implements the Cholesky factorization algorithm, which decomposes a symmetric positive-definite matrix into the product of a lower triangular matrix and its transpose.
- **LU Decomposition**: Implements LU decomposition, where a square matrix is factored into a lower triangular matrix and an upper triangular matrix.

### Project 2: ESOR, PSD, and OM Methods
- **ESOR (Explicit Successive Over-Relaxation)**: Implements the ESOR method for solving linear systems, optimizing the iteration process using over-relaxation.
- **PSD (Positive Semi-Definite)**: Implements the algorithm to check and ensure that matrices are positive semi-definite.
- **OM (Orthogonalization Method)**: Implements an orthogonalization method for solving systems of linear equations, producing orthonormal sets of vectors.

### Project 3: QR Decomposition using Householder Transformations
- Implements QR decomposition using Householder reflections, which decomposes a matrix into an orthogonal matrix (Q) and an upper triangular matrix (R).

## Makefile and Running the Project

### Compilation and Execution

Use the following commands to compile and run the projects. The Makefile provided helps you automate the build process.

1. **Compilation**:
    ```bash
    make all
    ```

    This will compile all the necessary executables for the algorithms:
    - `cholesky`
    - `cholesky_inv`
    - `lu`
    - `lu_inv`

2. **Running the Projects**:

    - **Cholesky Decomposition**:
      ```bash
      make runCholesky
      ```
      This runs the Cholesky decomposition for a 4x4 matrix.

    - **Inverse of Cholesky**:
      ```bash
      make runCholesky_inv
      ```
      This runs the inverse calculation of Cholesky decomposition for a 5x5 matrix.

    - **LU Decomposition**:
      ```bash
      make runLU
      ```
      This runs the LU decomposition for a 5x5 matrix.

    - **Inverse of LU**:
      ```bash
      make runLU_inv
      ```
      This runs the inverse calculation of LU decomposition for a 4x4 matrix.

### Makefile Example

Here’s an example of the **Makefile** that compiles and runs the various parts of the project:

```makefile
# Makefile for Cholesky and LU decomposition projects

# Compiler
CC = gcc
CFLAGS = -lm  # Link math library for certain functions (like sqrt)

# Output executables
EXECUTABLES = cholesky cholesky_inv lu lu_inv

# All targets
all: $(EXECUTABLES)

# Compile Cholesky and its inverse
cholesky: cholesky.c
	$(CC) -o cholesky cholesky.c $(CFLAGS)

cholesky_inv: cholesky_inv.c
	$(CC) -o cholesky_inv cholesky_inv.c $(CFLAGS)

# Compile LU decomposition and its inverse
lu: lu.c
	$(CC) -o lu lu.c $(CFLAGS)

lu_inv: lu_inv.c
	$(CC) -o lu_inv lu_inv.c $(CFLAGS)

# Running targets
runCholesky:
	./cholesky 4

runCholesky_inv:
	./cholesky_inv 5

runLU:
	./lu 5

runLU_inv:
	./lu_inv 4


