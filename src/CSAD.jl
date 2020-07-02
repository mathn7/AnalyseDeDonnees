module CSAD
using Plots
using Gaston
using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings

cheminTP3 = "TP3/"

include(cheminTP3*"couleur_moyenne.jl")
export couleur_moyenne

include(cheminTP3*"vraisemblance.jl")
export vraisemblance

include(cheminTP3*"moyenne_image.jl")
export moyenne_image

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



greet() = print("Hello World!")

end # module
