# Linear Numerical Algebra Project

This repository contains the implementations of algorithms for the course **Επιστημονικοί Υπολογισμοί (Αριθμητική Γραμμική Άλγεβρα)**, part of the **ΘΠ03** program.

## Course Overview

This course focuses on numerical methods in scientific computing, with a particular emphasis on linear algebra operations such as matrix decompositions, solving systems of equations, and eigenvalue problems. The projects in this repository demonstrate the application of various algorithms in these areas.

## Projects

### Project 1: Cholesky Decomposition & LU Decomposition
- **Cholesky Decomposition**: This project implements the Cholesky factorization algorithm, which decomposes a positive-definite matrix into a lower triangular matrix and its conjugate transpose.
- **LU Decomposition**: Implements the LU decomposition, where a matrix is factored into the product of a lower triangular matrix and an upper triangular matrix. This is often used for solving systems of linear equations.

### Project 2: ESOR, PSD, and OM Methods
- **ESOR (Explicit Successive Over-Relaxation)**: Implements the ESOR method for solving linear systems, optimizing the iteration process using over-relaxation.
- **PSD (Positive Semi-Definite)**: Implements the algorithm for checking and ensuring that matrices are positive semi-definite, a critical condition in many optimization and machine learning algorithms.

### Project 3: QR Decomposition using Householder Transformations
- Implements the QR decomposition algorithm using Householder reflections, which is used to factor a matrix into an orthogonal matrix (Q) and an upper triangular matrix (R).

## Installation

To compile and run the projects, make sure you have a C++ compiler installed (e.g., `g++`).

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/your-repo-name.git
    ```
2. Navigate to the project directory:
    ```bash
    cd your-repo-name
    ```

3. Compile the source files:
    ```bash
    g++ -o run main.cpp cholesky.cpp lu_decomposition.cpp esor.cpp psd.cpp qr_house.cpp
    ```

4. Run the program with appropriate arguments for each project. Example:
    ```bash
    ./run <project_number> <additional_arguments>
    ```

## Project Descriptions

### Cholesky Decomposition
- **Input**: A symmetric positive-definite matrix.
- **Output**: A lower triangular matrix `L` such that `A = L * L^T`.

### LU Decomposition
- **Input**: A square matrix.
- **Output**: Two matrices `L` and `U` such that `A = L * U`.

### ESOR Method
- **Input**: A matrix and initial guess for the solution vector.
- **Output**: The solution to the linear system after iterative refinement.

### PSD Check
- **Input**: A matrix.
- **Output**: A boolean indicating whether the matrix is positive semi-definite.

### QR Decomposition (Householder)
- **Input**: A matrix `A`.
- **Output**: Matrices `Q` (orthogonal) and `R` (upper triangular) such that `A = Q * R`.


