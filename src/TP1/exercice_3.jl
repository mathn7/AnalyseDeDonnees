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

## Calcul des composantes principales d'une image RVB

I = testimage("mandrill")        #" 1er exemple"

#"Decoupage de l'image en trois canaux et conversion en flottants"
C=channelview(I)
B = colorview(RGB, zeroarray, zeroarray, C[3,:,:])
R = colorview(RGB, C[1,:,:], zeroarray, zeroarray)
V = colorview(RGB, zeroarray, C[2,:,:], zeroarray)

#conversion des données
R = Gray.(R)
R=convert(Array{Gray{Float64},2},R)
R= Real.(R)

B = Gray.(B)
B=convert(Array{Gray{Float64},2},B)
B= Real.(B)

V = Gray.(V)
V=convert(Array{Gray{Float64},2},V)
V= Real.(V)

# Matrice des donnees
X = [R[:] V[:] B[:]];	# Les trois canaux sont vectorises et concatenes

# Matrice de variance/covariance
n = size(X,1)
x_barre = X'*ones(n,1)/n
X_c = X-ones(n,1)*x_barre';	# Centrage des donnees
Sigma = (X_c')*X_c/n

# Calcul des valeurs/vecteurs propres de Sigma :
D,W = eig(Sigma)

# Tri des valeurs propres :
valeurs_triees, = sort(D)
indices=sortperm(D)

# Projection sur la premiere composante principale :
W = W[:,indices];   # Permutation des colonnes de W
C = X_c*W;          # Changement d'axes du repere
C1 = reshape(C[:,1],size(R))

## Autres methodes de projection sur un canal pour une image RVB

# Calcul de l'image en niveaux de gris comme la moyenne des 3 canaux
I_nvg = (R+V+B)/3

# Calcul de l'image en niveaux de gris avec la fonction rgb2gray de Matlab
Y = Gray.(I)

## Affichage de l'image RVB et de ses differentes projections

# 1ere fenetre d'affichage
#figure("Name','Differentes projections pour une image RVB",..."Position",[0.01*L,0.1*H,0.71*L,0.75*H])

### Affichage de l'image RVB et de ses composantes principales
grid, frames, canvases = canvasgrid((2,2));  # 2 row, 2 columns
# 1ere fenetre d'affichage

# Affichage de l'image RVB
    ImageView.imshow(canvases[1,1], testimage("mandrill"))

# 1ere composante principale = projection sur la 1er vecteur principal
    ImageView.imshow(canvases[1,2],Gray.(C1))

# Moyenne des 3 canaux
    ImageView.imshow(canvases[2,1],Gray.(I_nvg))

# Fonction rgb2gray de Matlab
    ImageView.imshow(canvases[2,2],Gray.(I))
    win = Window(grid)
    showall(win)
