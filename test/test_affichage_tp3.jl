using Plots
using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings
using Markdown

include("../src/TP3/couleur_moyenne.jl")
include("../src/TP3/estimation_mu_sigma.jl")
include("../src/TP3/vraisemblance.jl")
include("../src/TP3/moyenne_amelioree.jl")
include("../src/TP3/exercice_1.jl")
include("../src/TP3/exercice_2.jl")
include("../src/TP3/exercice_3.jl")
include("../src/TP3/exercice_3_bis.jl")
include("../src/TP3/exercice_4.jl")

# fonction 
wait_for_key(text) = (print(stdout, text); read(stdin, 1); nothing)

println("Lancement des tests d'affichage ...")

wait_for_key("tapez entrée pour lancer l'exo 1")
tp3_exercice1(true,"src/TP3/")

wait_for_key("tapez entrée pour lancer l'exo 2")
tp3_exercice2(true,"src/TP3/")

wait_for_key("tapez entrée pour lancer l'exo 3")
tp3_exercice3(true,"src/TP3/")

wait_for_key("tapez entrée pour lancer l'exo 3 bis")
tp3_exercice3bis(true,"src/TP3/",[5.,3.,2.])

wait_for_key("tapez entrée pour lancer l'exo 4")
tp3_exercice4(true,"src/TP3/")

# supprimer les fichiers resultants
rm("../src/TP3/resultats-ex1.mat",force = true)
rm("../src/TP3/resultats-ex2.mat",force = true)
