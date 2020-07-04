module CSAD

using Plots
using Gaston
using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings
using Markdown

#============= TP3 ==============#
include("TP3/couleur_moyenne.jl")
export tp3_couleur_moyenne

include("TP3/vraisemblance.jl")
export tp3_vraisemblance

include("TP3/moyenne_amelioree.jl")
export tp3_moyenne_amelioree

include("TP3/estimation_mu_sigma.jl")
export tp3_estimation_mu_sigma

include("TP3/exercice_1.jl")
export tp3_exercice1

include("TP3/exercice_2.jl")
export tp3_exercice2

include("TP3/exercice_3.jl")
export tp3_exercice3

include("TP3/exercice_3_bis.jl")
export tp3_exercice3bis

include("TP3/exercice_4.jl")
export tp3_exercice4
#===============================#

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
export kppv

end # module
