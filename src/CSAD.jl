module CSAD

using Plots
using Gaston
using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings
using Markdown


include("TP3/couleur_moyenne.jl")
export couleur_moyenne

include("TP3/vraisemblance.jl")
export vraisemblance

include("TP3/moyenne_amelioree.jl")
export moyenne_amelioree

include("TP3/estimation_mu_et_sigma.jl")
export estimation_mu_et_sigma

include("TP3/exercice_1.jl")
export exercice1

include("TP3/exercice_2.jl")
export exercice2

include("TP3/exercice_3.jl")
export exercice3

include("TP3/exercice_4.jl")
export exercice4

#inclure les fonctions du Tp1
include("TP1/exercice_1.jl")
export Matrice_de_donnees
export Individu_moyen
export Donnees_centrees
export Matrice_var_cov

include("TP1/exercice_2.jl")
export Composantes_principales
export Sigma2

#inclure la fonction kppv
include("TP4/kppv.jl")
export kppv.jl

end # module
