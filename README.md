<h1 align="center">📐 Solving Partial Differential Equations with Fourier Series (Julia)</h1>

<p align="center">
  Academic project focused on the <strong>resolution of partial differential equations (PDEs)</strong>
  using <strong>Fourier series</strong>, implemented in <strong>Julia</strong>.
  The work combines theoretical foundations with symbolic computation and visualization.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Language-Julia-9558B2?logo=julia&logoColor=white&style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Math-PDEs%20%26%20Fourier%20Series-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Symbolic%20Computation-SymPy-green?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Visualization-Plots.jl-orange?style=for-the-badge"/>
</p>

<p align="center">
  <a href="https://deepwiki.com/maria2332/fourier-series-Julia" target="_blank">
    <img src="https://img.shields.io/badge/DeepWiki-Documentation-purple?style=for-the-badge"/>
  </a>
</p>

---

## 📚 Project Documentation (External)

An automatically generated documentation view of this repository is available via DeepWiki:

👉 https://deepwiki.com/maria2332/fourier-series-Julia

---

## 📘 Project Overview

This repository contains the practical work **“Resolución de Ecuaciones Diferenciales Parciales mediante Series de Fourier en Julia”**, where a classical heat-type partial differential equation is solved using **separation of variables and Fourier series expansion**.

The project covers:

- Theoretical derivation of the PDE solution
- Fourier series under different boundary conditions
- Symbolic computation of eigenfunctions and coefficients
- Numerical evaluation and graphical visualization of solutions

---

## 🧮 Mathematical Problem

We study a PDE of the form:

\[
\frac{\partial u}{\partial t} = b \frac{\partial^2 u}{\partial x^2}
\]

Using separation of variables:

\[
u(x,t) = X(x)T(t)
\]

This leads to two ordinary differential equations:

- Spatial problem:
  \[
  X''(x) + \lambda X(x) = 0
  \]
- Temporal problem:
  \[
  T'(t) + b \lambda T(t) = 0
  \]

The solution depends on the **boundary conditions**, which are treated separately.

---

## 🔒 Boundary Conditions Supported

### Dirichlet Boundary Conditions
\[
u(0,t) = u(L,t) = 0
\]

- Eigenfunctions:
  \[
  X_n(x) = \sin\left(\frac{n\pi x}{L}\right)
  \]
- Eigenvalues:
  \[
  \lambda_n = \left(\frac{n\pi}{L}\right)^2
  \]

### Neumann Boundary Conditions
\[
u_x(0,t) = u_x(L,t) = 0
\]

- Eigenfunctions:
  \[
  X_n(x) = \cos\left(\frac{(2n-1)\pi x}{2L}\right)
  \]
- Eigenvalues:
  \[
  \lambda_n = \left(\frac{(2n-1)\pi}{2L}\right)^2
  \]

---

## ⚙️ Implementation Details

The solution is implemented in **Julia**, using:

- **SymPy.jl** for symbolic computation:
  - Eigenfunctions
  - Integrals for Fourier coefficients
- **Plots.jl** for visualization of:
  - Spatial profiles \( u(x,t_0) \)
  - Temporal evolution \( u(x_0,t) \)

Key components implemented in code:

- `Xn_expression`: computes spatial eigenfunctions
- `Tm_expression`: computes time-dependent terms
- `calculate_km` and `calculate_km1`: Fourier coefficients
- `U_expression`: full solution \( u(x,t) \)

---

## 📊 Visualization

The project includes graphical representations of:

- The spatial solution for fixed time and different modes \( n \)
- The temporal evolution at a fixed spatial point
- Comparison of multiple Fourier modes

These plots allow a clear interpretation of how the solution evolves both in space and time.

---

## 🎓 Academic Context

This project was developed as part of an academic course on Partial Differential Equations and Fourier Methods, with a strong emphasis on:

Mathematical rigor

Clear separation between theory and implementation

Interpretability of results
