@doc doc"""
Résolution approchée du problème au sens du moindre carrée

# Syntaxe
```julia
X_sol = MCO(x,y)
```
# Entrées :
   * **x**       : (Array{Float,1}) le vecteur x definissant les paramètres du prb
   * **y**       : (Array{Float,1}) le vecteur y definissant les paramètres du prb

# Sorties:
   * **X_sol**    : (Array{Float,1}) la solution du problème  : AX=B
"""
function MCO(x,y)
    n = length(x)
    A = [(x.*x)' (x.*y)' (y.*y)' x' y' ones(n,1)]
    B = zeros(n,1)
    A = [A ; 1 0 1 0 0 0]
    B = [B ; 1]
    X_sol=pinv(A)*B
    X_sol = X_sol/norm(X_sol,2)
    return X_sol
end
