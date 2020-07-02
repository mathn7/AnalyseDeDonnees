module CSAD

using Plots
using Gaston
using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings
using Markdown

cheminTP3 = "TP3/"

include(cheminTP3*"couleur_moyenne.jl")
export couleur_moyenne

include(cheminTP3*"vraisemblance.jl")
export vraisemblance

include(cheminTP3*"moyenne_amelioree.jl")
export moyenne_amelioree

include(cheminTP3*"estimation_mu_et_sigma.jl")
export estimation_mu_et_sigma

include(cheminTP3*"exercice_1.jl")
export exercice1

include(cheminTP3*"exercice_2.jl")
export exercice2

include(cheminTP3*"exercice_3.jl")
export exercice3

include(cheminTP3*"exercice_4.jl")
export exercice4

#inclure les fonctions du Tp1
include("TP1/exercice_1.jl")
include("TP1/exercice_2.jl")

#inclure la fonction kppv
include("TP4/kppv.jl")

end # module
