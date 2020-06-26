#=-------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP1 - Espace de representation des couleurs
  Exercice_1.js
--------------------------------------------------------------------------
=#

#importation des bibliothèques

using PyPlot
using ImageView
using TestImages, Gtk.ShortNames
using Images
using ImageMagick
using Statistics
using LinearAlgebra
using Printf

#Entrée : matrice representatrice l'image

#Sortie : la matrice Sigma, de variance/covariance des variables aléatoires
#         correspondant aux trois canaux R, V et B (matrice de taille 3 × 3)

function Matrice_var_cov(I)

#nettoyer l'environnement
ImageView.closeall()
clf() #à commenter si vous n'êtes pas sous Atom


#pygui(true) #pour afficher l'image en dehors d'atom
"# Decompostion des canaux RVB d'une image couleur #"

#I = testimage("mandrill")        #" exemple d'une image tiréé du package ImageMagick

#I = load("src/TP1/automn.tiff")        #" 1er exemple d'une image locale"

"#Decoupage de l'image en trois canaux et conversion en flottants"
C = channelview(I);
R = float(C[1,:,:]);
V = float(C[2,:,:]);
B = float(C[3,:,:]);


gui = imshow_gui((300,300),(2, 2))  # La fenetre comporte 2 lignes et 2 colonnes (affichage 300×300)
canvases = gui["canvas"]

"###### Affichage de l'image RVB et de ses canaux  #######"

"# Affichage de l'image RVB"

ImageView.imshow(canvases[1,1], I) #1ere ligne ,1ere colonne

"# Affichage du canal R"

ImageView.imshow(canvases[1,2],R) #1ere ligne ,2nd colonne

"#Affichage du canal V"

ImageView.imshow(canvases[2,1],V) #2nd ligne ,1ere colonne

"# Affichage du canal B"

ImageView.imshow(canvases[2,2],B) #2nd ligne ,2nd colonne

"#affichage de tous les images"

Gtk.showall(gui["window"])


"# Enregistrement des images des canaux "

save("src/TP1/canal_R.png",C[1,:,:])   #pour enregistrer l'image coloré
                               #save("src/TP1/canal_R.png",colorview(RGB, C[1,:,:], zeroarray, zeroarray))
save("src/TP1/canal_V.png",C[2,:,:])   #pour enregistrer l'image coloré
                               #save("src/TP1/canal_V.png",colorview(RGB,  zeroarray,C[2,:,:], zeroarray))
save("src/TP1/canal_B.png",C[3,:,:])   #pour enregistrer l'image coloré
                               #save("src/TP1/canal_B.png",colorview(RGB, zeroarray, zeroarray, C[3,:,:]))

"####### Calcul des correlations entre les canaux RVB et des contrastes  #####"

"# Matrice des donnees "

X = [R[:] V[:] B[:]];	"#Les trois canaux sont vectorises et concatenes"

"# Matrice de variance/covariance"

(n,p)= size(X);
x_barre = X'*ones(n,1)/n;
X_c = X-ones(n,1)*x_barre';	# Centrage des donnees
Sigma = (X_c')*X_c/n;

"# Coefficients de correlation lineaire"
#=
@printf("Correlation r(R,V) = %0.3f\n",Sigma[1,2]/sqrt(Sigma[1,1]*Sigma[2,2]));
@printf("Correlation r(R,B) = %0.3f\n",Sigma[1,3]/sqrt(Sigma[1,1]*Sigma[3,3]));
@printf("Correlation r(V,B) = %0.3f\n",Sigma[2,3]/sqrt(Sigma[2,2]*Sigma[3,3]));

"# Proportions de contraste"

c = sum(diag(Sigma));
@printf("Proportion de contraste dans le canal R = %0.3f\n",Sigma[1,1]/c);
@printf("Proportion de contraste dans le canal V = %0.3f\n",Sigma[2,2]/c);
@printf("Proportion de contraste dans le canal B = %0.3f\n",Sigma[3,3]/c);
=#
"#Affichage du nuage de pixels dans le repere RVB "

#Deuxieme fenetre d affichage
PyPlot.scatter3D(R,V,B,"b.")
PyPlot.title("Representation 3D des pixels dans lespace RVB",FontSize=20)
PyPlot.xlabel("R")
PyPlot.ylabel("V")
PyPlot.zlabel("B")

"#pour que la derniére fenêtre s'affiche sous Atom il faut que cette commande
 #soit la dernière commande !"

gcf() #à commmenter si vous n'êtes pas sous Atom

return Sigma
end
