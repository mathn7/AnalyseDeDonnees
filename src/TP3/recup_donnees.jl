"""
--------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP3 - Classification bayesienne
 recup_donnees.jl
--------------------------------------------------------------------------
"""

using Plots
using MAT
using Primes

include("float_to_RGB.jl")
# fonction pour attendre
tapez_entrer(text) = (print(stdout, text); read(stdin, 1); nothing)

# Chemin d'acces aux images
chemin = "./images/"

## Images de pensees
# Chargement des images
fichier = chemin*"pensees.mat"
images = matread(fichier)
nb_images_pensees = length(images)

# Affichage des images
fact = Primes.factor(Vector,nb_images_pensees) # factorisation en nombres premiers
nb_lignes_affichage = min(fact[2],fact[1])
nb_colonnes_affichage = max(fact[2],fact[1])

plt = plot(layout=(nb_lignes_affichage,nb_colonnes_affichage),showaxis = false)
for i = 1:nb_images_pensees
	im = float_to_RGB(images["pe$i"])
	Plots.plot!(plt[i],im)
end
display(plt)
println("Affichage des pensees ...")
tapez_entrer("tapez la clé entrer pour voir les oeillets")

## Images d'oeillets
# Chargement des images
fichier = chemin*"oeillets.mat"
images = matread(fichier)
nb_images_oeillets = length(images)

# Affichage des images
fact = Primes.factor(Vector,nb_images_oeillets) # factorisation en nombres premiers
nb_lignes_affichage = min(fact[2],fact[1])
nb_colonnes_affichage = max(fact[2],fact[1])

plt = plot(layout=(nb_lignes_affichage,nb_colonnes_affichage),showaxis = false)
for i = 1:nb_images_oeillets
	im = float_to_RGB(images["oe$i"])
	Plots.plot!(plt[i],im)
end
display(plt)
println("Affichage des oeillets ...")
tapez_entrer("tapez la clé entrer pour voir les chrysanthemes")

## Images de chrysanthemes
# Chargement des images
fichier = chemin*"chrysanthemes.mat"
images = matread(fichier)
nb_images_chrysanthemes = length(images)

# Affichage des images
fact = Primes.factor(Vector,nb_images_chrysanthemes) # factorisation en nombres premiers
nb_lignes_affichage = min(fact[2],fact[1])
nb_colonnes_affichage = max(fact[2],fact[1])

plt = plot(layout=(nb_lignes_affichage,nb_colonnes_affichage),showaxis = false)
for i = 1:nb_images_chrysanthemes
	im = float_to_RGB(images["ch$i"])
	Plots.plot!(plt[i],im)
end
display(plt)
println("Affichage des chrysanthemes ...")