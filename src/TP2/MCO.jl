#  Cette fonction evalue la fonction f du probl�me de moindres carres :

#  Inputs
#  Outputs:
#  f : valeur d

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
# Exemple d'appel
```@example
using Projet-CSAD
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
x0 = [1; 0]
options = []
xmin,f_min,flag,nb_iters = Algorithme_De_Newton(f,gradf,hessf,x0,options)
```
"""


function MCO(x,y)
    # Initialisation
    n = length(x)

    A = [(x.*x)' (x.*y)' (y.*y)' x' y' ones(n,1)]
    B = zeros(n,1)
    A = [A ; 1 0 1 0 0 0]
    B = [B ; 1]
    X_sol=pinv(A)*B
    return X_sol
end
