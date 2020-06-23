#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP1 - Espace de representation des couleurs
# Exercice_3.jl
#--------------------------------------------------------------------------

## Calcul de la 1ere composante principale d'une image RVB

#importation des bibliothèques

using PyPlot
using ImageView
using TestImages, Gtk.ShortNames
using Images

ImageView.closeall()
clf()

## Calcul des composantes principales d'une image RVB

I = load("src/TP1/coloredChips.png")        #chargement de l'image

#Decoupage de l'image en trois canaux et conversion en flottants
CI = channelview(I)
R = float(CI[1,:,:])
V = float(CI[2,:,:])
B = float(CI[3,:,:])

# Matrice des donnees
X = [R[:] V[:] B[:]];	# Les trois canaux sont vectorises et concatenes

# Matrice de variance/covariance
n = size(X,1)
x_barre = X'*ones(n,1)/n
X_c = X-ones(n,1)*x_barre';	# Centrage des donnees
Sigma = (X_c')*X_c/n

# Calcul des valeurs/vecteurs propres de Sigma
D,W = eigen(Sigma)

#Tri des valeurs propres dans l'ordre décroissant:
indices=sortperm(D,rev=true)

#Calcul des composantes principales et des coefficients de projection
W = W[:,indices];   # Permutation des colonnes de W
C = X_c*W          # Changement d'axes du repere
C1 = reshape(C[:,1],size(R))

## Autres methodes de projection sur un canal pour une image RVB

# Calcul de l'image en niveaux de gris comme la moyenne des 3 canaux
I_nvg = (R+V+B)/3

# Calcul de l'image en niveaux de gris avec la fonction rgb2gray de Matlab
Y = Gray.(I)

## Affichage de l'image RVB et de ses differentes projections

gui = imshow_gui((300,300),(2, 2))  # La fenetre comporte 2 lignes et 2 colonnes (affichage 300×300)
# 1ere fenetre d'affichage
canvases = gui["canvas"]

# Affichage de l'image RVB
ImageView.imshow(canvases[1,1], I) # 1ere ligne, 1ere colonne

# 1ere composante principale = projection sur la 1er vecteur principal
ImageView.imshow(canvases[1,2],C1) # 1ere ligne, 2nd colonne

# Moyenne des 3 canaux
ImageView.imshow(canvases[2,1],I_nvg) # 2nd ligne, 1ere colonne

# Fonction Gray de Julia
ImageView.imshow(canvases[2,2],Y) # 2nd ligne, 2nd colonne
Gtk.showall(gui["window"])
