#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP1 - Espace de representation des couleurs
# Exercice_2.m
#--------------------------------------------------------------------------

#importation des bibliothèques

using PyPlot
using ImageView
using TestImages, Gtk.ShortNames
using Images
using ImageMagick
using LinearAlgebra
using Statistics
using Gaston

#nettoyer l'environnement
ImageView.closeall()
clf() #à commenter si vous n'êtes pas sous Atom

## ########## Calcul des composantes principales d'une image RVB #########

I = load("src/TP1/automn.tiff")        #chargement de l'image

#Decoupage de l'image en trois canaux et conversion en flottants
CI = channelview(I)
R = float(CI[1,:,:])
V = float(CI[2,:,:])
B = float(CI[3,:,:])


# Matrice des donnees
X = [R[:] V[:] B[:]];	#Les trois canaux sont vectorises et concatenes

# Matrice de variance/covariance
(n,p)= size(X);
x_barre = X'*ones(n,1)/n;
X_c = X-ones(n,1)*x_barre';	# Centrage des donnees
Sigma = (X_c')*X_c/n;

# Calcul des valeurs/vecteurs propres de Sigma
D,W = eigen(Sigma)

#Tri des valeurs propres dans l'ordre décroissant:
indices=sortperm(D,rev=true)

#Calcul des composantes principales et des coefficients de projection
W = W[:,indices];   # Permutation des colonnes de W
C = X_c*W          # Changement d'axes du repere
C1 = reshape(C[:,1],size(R))
C2 = reshape(C[:,2],size(R))
C3 = reshape(C[:,3],size(R))

##  ####### Affichage de l'image RVB et de ses composantes principales #######
gui = imshow_gui((300,300),(2, 2))  # La fenetre comporte 2 lignes et 2 colonnes (affichage 300×300)
# 1ere fenetre d'affichage
canvases = gui["canvas"]

# Affichage de l'image RVB
ImageView.imshow(canvases[1,1], I) # 1ere ligne, 1ere colonne

# 1ere composante principale = projection sur la 1er vecteur principal
ImageView.imshow(canvases[1,2],C1) # 1ere ligne, 2nd colonne

# 2eme composante principale = projection sur la 2eme vecteur principal
ImageView.imshow(canvases[2,1],C2) # 2nd ligne, 1ere colonne

# 3eme composante principale = projection sur la 3eme vecteur principal
ImageView.imshow(canvases[2,2],C3) # 2nd ligne, 2nd colonne

Gtk.showall(gui["window"])


# Enregistrement des images des composantes principales
ImageMagick.save("src/TP1/CP1.png",(C1.-minimum(C1[:]))/(maximum(C1[:].-minimum(C1[:]))))
ImageMagick.save("src/TP1/CP2.png",(C2.-minimum(C2[:]))/(maximum(C2[:].-minimum(C2[:]))))
ImageMagick.save("src/TP1/CP3.png",(C3.-minimum(C3[:]))/(maximum(C3[:].-minimum(C3[:]))))

## Affichage du nuage de pixels dans le repere des composantes principales

# Deuxieme fenetre d'affichage
    figure("Nuage de pixels dans le repere des composantes principales",figsize=(30,30))
    scatter3D(C1,C2,C3,"r*")
    #axis("equal")
    xlabel("1ere CP",FontWeight=20)
    ylabel("2eme CP",FontWeight=20)
    zlabel("3eme CP",FontWeight=20)
    title("Representation 3D des pixels dansl''espace des composantes principales",FontWeight=20)
#=
Gaston.surf(C1,C2,C3,lc = :green,
           pointtype ="dot",ms=5,
           legend=:Vraisemblance_empirique,
           Gaston.Axes(title=:"'Estimation pour les chrysanthemes'",
           xlabel = :r_bar,
           ylabel = :v_bar,
           hidden3d = :on))
=#

## Calcul des correlations entre les composantes principales et des contrastes

# Matrice de variance/covariance dans le nouveau repere
Sigma_2 = (C')*C/n

# Coefficients de correlation lineaire
println("Correlation r[C1,C2] = ",Sigma_2[1,2]/sqrt(Sigma_2[1,1]*Sigma_2[2,2]))
println("Correlation r[C1,C3] = ",Sigma_2[1,3]/sqrt(Sigma_2[1,1]*Sigma_2[3,3]))
println("Correlation r[C2,C3] = ",Sigma_2[2,3]/sqrt(Sigma_2[2,2]*Sigma_2[3,3]))

# Proportions de contraste
c = sum(Sigma_2)
println("Proportion de contraste dans le canal C1 = ",Sigma_2[1,1]/c)
println("Proportion de contraste dans le canal C2 = ",Sigma_2[2,2]/c)
println("Proportion de contraste dans le canal C3 = ",Sigma_2[3,3]/c)

gcf() #à commenter si vous n'êtes pas sous Atom
