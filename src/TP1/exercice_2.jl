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
X = [R[:] V[:] B[:]]	# Les trois canaux sont vectorises et concatenes
# Matrice de variance/covariance :
n = size(X,1)
x_barre = X'*ones(n,1)/n
X_c = X-ones(n,1)*x_barre';	# Centrage des donnees
Sigma = (X_c')*X_c/n

# Calcul des valeurs/vecteurs propres de Sigma
D,W = eig(Sigma)

# Tri des valeurs propres :
valeurs_triees = sort(D)
indices=sortperm(D)
# Calcul des composantes principales et des coefficients de projection
W = W[:,indices];   # Permutation des colonnes de W
C = X_c*W          # Changement d'axes du repere
C1 = reshape(C[:,1],size(R))
C2 = reshape(C[:,2],size(R))
C3 = reshape(C[:,3],size(R))

## Affichage de l'image RVB et de ses composantes principales
grid, frames, canvases = canvasgrid((2,2));  # 2 row, 2 columns
# 1ere fenetre d'affichage
#figure("ACP d''une image RVB",figsize=(30,30))
# Affichage de l'image RVB
    ImageView.imshow(canvases[1,1], testimage("mandrill"))

# 1ere composante principale = projection sur la 1er vecteur principal
    ImageView.imshow(canvases[1,2],Gray.(C1))

# 2eme composante principale = projection sur la 2eme vecteur principal
    ImageView.imshow(canvases[2,1],Gray.(C2))

# 3eme composante principale = projection sur la 3eme vecteur principal
    ImageView.imshow(canvases[2,2],Gray.(C3))
    win = Window(grid)
    showall(win)

# Enregistrement des images des composantes principales
#imwrite(uint8(255*(C1-minimum(C1))/(max(C1[:]-minimum(C1)))),"CP1.png")
#imwrite(uint8(255*(C2-minimum(C2))/(max(C2[:]-minimum(C2)))),"CP2.png")
#imwrite(uint8(255*(C3-minimum(C3))/(max(C3[:]-minimum(C3)))),"CP3.png")

## Affichage du nuage de pixels dans le repere des composantes principales

# Deuxieme fenetre d'affichage
    figure("Nuage de pixels dans le repere des composantes principales",figsize=(30,30))
    scatter3D(C1,C2,C3,"r*")
    axis("equal")
    xlabel("1ere CP",FontWeight=20)
    ylabel("2eme CP",FontWeight=20)
    zlabel("3eme CP",FontWeight=20)
    title({"Representation 3D des pixels dansl''espace des composantes principales'",FontWeight=20)


## Calcul des correlations entre les composantes principales et des contrastes

# Matrice de variance/covariance dans le nouveau repere
Sigma_2 = (C')*C/n

# Coefficients de correlation lineaire
print("Correlation r[C1,C2] = %",Sigma_2[1,2]/sqrt(Sigma_2[1,1]*Sigma_2[2,2]))
print("Correlation r[C1,C3] = %",Sigma_2[1,3]/sqrt(Sigma_2[1,1]*Sigma_2[3,3]))
print("Correlation r[C2,C3] = %",Sigma_2[2,3]/sqrt(Sigma_2[2,2]*Sigma_2[3,3]))

# Proportions de contraste
c = sum(Sigma_2)
print("Proportion de contraste dans le canal C1 = %",Sigma_2[1,1]/c)
print("Proportion de contraste dans le canal C2 = %",Sigma_2[2,2]/c)
print("Proportion de contraste dans le canal C3 = %",Sigma_2[3,3]/c)
