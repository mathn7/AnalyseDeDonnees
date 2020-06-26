"""
--------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP3 - Classification bayesienne
 recup_donnees.jl
--------------------------------------------------------------------------
"""

using MAT
using Primes
using ImageView
using TestImages
using Gtk.ShortNames
include("float_to_RGB.jl")

ImageView.closeall()

# Chemin d'acces aux images
chemin = "./images/"

## Images de pensees

# Chargement des images
fichier = chemin*"pensees.mat"
images = matread(fichier)
nb_images_pensees = length(images)

# Affichage des images
fact = Primes.factor(Vector,nb_images_pensees) # factorisation en nombres premiers
nb_lignes_affichage = fact[2]
nb_colonnes_affichage = fact[1]

#figure('Images de pensees')
gui = imshow_gui((400, 400), (nb_lignes_affichage,nb_colonnes_affichage))
canvases = gui["canvas"]
img = testimage("lighthouse")
for i = 1:nb_lignes_affichage
	for j = 1: nb_colonnes_affichage
		im = float(images["pe$i"])./255
		imshow(canvases[i,j], float_to_RGB(im,img))#,label="Pensee n°$i")
	end
end
Gtk.showall(gui["window"])

## Images d'oeillets

fichier = chemin*"oeillets.mat"
images = matread(fichier)
nb_images_oeillets = length(images)

# Affichage des images
fact = Primes.factor(Vector,nb_images_oeillets) # factorisation en nombres premiers
nb_lignes_affichage = fact[2]
nb_colonnes_affichage = fact[1]

gui = imshow_gui((400, 400), (nb_lignes_affichage,nb_colonnes_affichage))
canvases = gui["canvas"]
for i = 1:nb_lignes_affichage
	for j = 1: nb_colonnes_affichage
		im = float(images["oe$i"])./255
		imshow(canvases[i,j], float_to_RGB(im,img))#,label="oeillets n°$i")
	end
end
Gtk.showall(gui["window"])
## Images de chrysanthemes

# Chargement des images
fichier = chemin*"chrysanthemes.mat"
images = matread(fichier)
nb_images_chrysanthemes = length(images)

# Affichage des images
fact = Primes.factor(Vector,nb_images_chrysanthemes) # factorisation en nombres premiers
nb_lignes_affichage = fact[2]
nb_colonnes_affichage = fact[1]

gui = imshow_gui((400, 400), (nb_lignes_affichage,nb_colonnes_affichage))
canvases = gui["canvas"]
for i = 1:nb_lignes_affichage
	for j = 1: nb_colonnes_affichage
		im = float(images["ch$i"])./255
		imshow(canvases[i,j], float_to_RGB(im,img))#,label="oeillets n°$i")
	end
end
Gtk.showall(gui["window"])

# TODO 
#=
drawnow
clear chemin fact fichier i nb_lignes_affichage nb_colonnes_affichage s taille_ecran
save donnees
=#