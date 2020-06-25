#-------------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# exercice_1.jl
#-------------------------------------------------------------------------------

using Plots
using MAT
using Statistics
using LaTeXStrings

include("moyenneim.jl")
# Chargement des donnees sous forme d'un dictionnaire
vars = matread("donnees.mat")

nb_images_pensees = Integer(vars["nb_images_pensees"])
nb_images_oeillets = Integer(vars["nb_images_oeillets"])
nb_images_chrysanthemes = Integer(vars["nb_images_chrysanthemes"])
## Calcul des vecteurs de moyenne des images de fleurs
# Couleur moyenne de chaque image de pensee [fonction a coder]
X_pensees = zeros(nb_images_pensees,2)
for i = 1:nb_images_pensees
	im = vars["pe"*string(i)]
	X_pensees[i,:] = moyenneim(im)
end

# Couleur moyenne de chaque image d oeillet [fonction a coder]
X_oeillets = zeros(nb_images_oeillets,2)
for i = 1:nb_images_oeillets
	im = vars["oe"*string(i)]
	X_oeillets[i,:] = moyenneim(im)
end

# Couleur moyenne de chaque image de chrysantheme
X_chrysanthemes = zeros(nb_images_chrysanthemes,2)
for i = 1:nb_images_chrysanthemes
	im = vars["ch"*string(i)]
	X_chrysanthemes[i,:] = moyenneim(im)
end

## Affichage des couleurs moyennes des images de fleurs

# Vecteur r et v pour les axes()
pas = 0.0025
r = 0.35:pas:0.60
v = 0.2:pas:0.45
nb_r = length(collect(r))
nb_v = length(collect(v))
pyplot()
scatter(X_pensees[:,1],X_pensees[:,2],color=:red,marker=:star7,markerstrokecolor=:red,markersize=15,
	title="Couleurs moyennes des images",label="Pensees",xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}",
	xlim=(r[1],r[end]),ylim=(v[1],v[end]))
scatter!(X_oeillets[:,1],X_oeillets[:,2],color=:green,markerstrokecolor=:green,markersize=15,label="Oeillets")
scatter!(X_chrysanthemes[:,1],X_chrysanthemes[:,2],color=:blue,marker=:+,markerstrokecolor=:blue,markersize=15,label="Chrysantemes")
### TODO : sauvegarde des variables 