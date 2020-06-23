#=-------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP1 - Espace de representation des couleurs
  Exercice_1.js
--------------------------------------------------------------------------
=#
using PyPlot
using ImageView
using TestImages, Gtk.ShortNames
using Images
using ImageMagick
using Statistics
using LinearAlgebra

ImageView.closeall()

"# Decompostion des canaux RVB d'une image couleur #"

#I = testimage("mandrill")        #" exemple d'une image tiréé du package ImageMagick

I = load("src/TP1/automn.tiff")        #" 1er exemple d'une image locale"

"#Decoupage de l'image en trois canaux et conversion en flottants"
C = channelview(I)
R = float(C[1,:,:])
V = float(C[2,:,:])
B = float(C[3,:,:])

gui = imshow_gui((300,300),(2, 2))  # 2 colonnes x 2 lignes d'images (initialisés par 300×300)
canvases = gui["canvas"]

"###### Affichage de l'image RVB et de ses canaux  #######"

"# Affichage de l'image RVB"

ImageView.imshow(canvases[1,1], I) #1er ligne ,1er colonne

"# Affichage du canal R"

ImageView.imshow(canvases[1,2],R) #1er ligne ,2eme colonne

"#Affichage du canal V"

ImageView.imshow(canvases[2,1],V) #2eme ligne ,1er colonne

"# Affichage du canal B"

ImageView.imshow(canvases[2,2],B) #2eme ligne ,2eme colonne

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

println("Correlation r(R,V) = ",Sigma[1,2]/sqrt(Sigma[1,1]*Sigma[2,2]));
println("Correlation r(R,B) = ",Sigma[1,3]/sqrt(Sigma[1,1]*Sigma[3,3]));
println("Correlation r(V,B) = ",Sigma[2,3]/sqrt(Sigma[2,2]*Sigma[3,3]));

"# Proportions de contraste"

c = sum(diag(Sigma));
println("Proportion de contraste dans le canal R = ",Sigma[1,1]/c);
println("Proportion de contraste dans le canal V = ",Sigma[2,2]/c);
println("Proportion de contraste dans le canal B = ",Sigma[3,3]/c);

"#Affichage du nuage de pixels dans le repere RVB "

#Deuxieme fenetre d affichage
PyPlot.title("Representation 3D des pixels dans lespace RVB",FontSize=20)
PyPlot.xlabel("R")
PyPlot.ylabel("V")
PyPlot.zlabel("B")
PyPlot.surf(R,V,B)

"#pour que la derniére fenêtre s'affiche il faut que cette commande
 #soit la dernière commande !"

gcf()
