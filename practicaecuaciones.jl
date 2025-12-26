using SymPy

function Xn_expression(x, n, L, lambda_val, boundary_type)
    if boundary_type == "dirichlet"
        if simplify(lambda_val - ((n * π) / L) ^ 2) == 0
            return sin(n * π * x / L)
        else
            return nothing
        end
    elseif boundary_type == "neumann"
        if simplify(lambda_val - (((2 * n - 1) * π) / (2 * L)) ^ 2) == 0
            return cos((2 * n - 1) * π * x / (2 * L))
        else
            return nothing
        end
    else
        return nothing
    end
end

function Tm_expression(n, t, lambda_val, b)
    return exp(b * lambda_val * t)
end

function calculate_km(f, Xm, L, b)
    x = symbols("x")
    numerator = integrate(f * Xm, (x, 0, L))
    denominator = integrate(Xm ^ 2, (x, 0, L))
    km = numerator / denominator
    return km / b
end

function calculate_km1(h, Xm, L, b)
    x = symbols("x")
    numerator = integrate(h * Xm, (x, 0, L))
    denominator = integrate(Xm ^ 2, (x, 0, L))
    km1 = numerator / denominator
    return km1 / -b
end

function U_expression(x, t, n, L, lambda_val, f, h, b, km, km1, boundary_type)
    Xn = Xn_expression(x, n, L, lambda_val, boundary_type)
    Tm = Tm_expression(n, t, lambda_val, b)
    if Xn !== nothing && Tm !== nothing
        return Xn * (km1 * Tm + km)
    else
        return nothing
    end
end

# Ejemplo de uso:
@vars n x t
L = 1
lambda_val_dirichlet = ((n * π) / L) ^ 2
lambda_val_neumann = (((2 * n - 1) * π) / (2 * L)) ^ 2
b = -1

# Ejemplo de función f(x)
f = 0 # Puedes definir tu propia función f(x) aquí

# Ejemplo de condición inicial h(x)
h = 1 # Puedes definir tu propia función h(x) aquí

# Boundary type
boundary_type = "neumann"  # Cambia a "dirichlet" para condiciones de frontera de Dirichlet

# Calculando km
if boundary_type == "dirichlet"
    Xm = sin(n * π * x / L)
    lambda_val = lambda_val_dirichlet
elseif boundary_type == "neumann"
    Xm = cos((2 * n - 1) * π * x / (2 * L))
    lambda_val = lambda_val_neumann
else
    error("Tipo de frontera no válido")
end

km = calculate_km(f, Xm, L, b)
println("Valor de km:", km)

# Calculando km1
km1 = calculate_km1(h, Xm, L, b)
println("Valor de km1:", km1)

# Expresión de U(x, t)
U = U_expression(x, t, n, L, lambda_val, f, h, b, km, km1, boundary_type)
println("U(x, t) =", U)

#grafico de la solucion 
using Plots
gr()

x_vals = 0:0.01:L
t_vals = 0:0.01:1

n_vals = 1:5

plot(x_vals, [U(x, 0.1, 5) for x in x_vals], label="n=5")
plot!(x_vals, [U(x, 0.1, 4) for x in x_vals], label="n=4")
plot!(x_vals, [U(x, 0.1, 3) for x in x_vals], label="n=3")
plot!(x_vals, [U(x, 0.1, 2) for x in x_vals], label="n=2")
plot!(x_vals, [U(x, 0.1, 1) for x in x_vals], label="n=1")

plot!(t_vals, [U(0.5, t, 5) for t in t_vals], label="x=0.5")
plot!(t_vals, [U(0.5, t, 4) for t in t_vals], label="x=0.5")
plot!(t_vals, [U(0.5, t, 3) for t in t_vals], label="x=0.5")
plot!(t_vals, [U(0.5, t, 2) for t in t_vals], label="x=0.5")
plot!(t_vals, [U(0.5, t, 1) for t in t_vals], label="x=0.5")

plot!(legend=:bottomright)

