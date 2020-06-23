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
#=
R = colorview(RGB, C[1,:,:], zeroarray, zeroarray);
V = colorview(RGB, zeroarray, C[2,:,:], zeroarray);
B = colorview(RGB, zeroarray, zeroarray, C[3,:,:]);
=#

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


#" Enregistrement des images des canaux "
#save("TP Analyse de Donnees/canal_R.png",img)
#imwrite(uint8(V),'canal_V.png')
#imwrite(uint8(B),'canal_B.png')

#" Affichage du nuage de pixels dans le repere RVB "
#=

R_gray = Gray.(R)
R_gray_float=convert(Array{Gray{Float64},2},R)
R= Real.(R_gray_float).*100;
B_gray = Gray.(B)
B_gray_float=convert(Array{Gray{Float64},2},B)
B= Real.(B_gray_float).*100;
V_gray = Gray.(V)
V_gray_float=convert(Array{Gray{Float64},2},V)
V= Real.(V_gray_float).*100;
=#
#gcf() #PyPlot.display_figs()

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

#le vecteur col contient des 1
#et a pour dimension le nombre des colonnes de X
#=
col = [1. for i in range(1,length=size(X,2))]
X_bar= mean(col',X);
Sigma = 1/n.*transpose(X)*X-X_bar*X_bar;

# "Coefficients de correlation lineaire"
sigR=(abs(Sigma[1,1]))^(1/2);
sigV=(abs(Sigma[2,2]))^(1/2);
sigB=(abs(Sigma[3,3]))^(1/2);
correlationRB=Sigma[1,3];
correlationVB=Sigma[2,3];
correlationVR=Sigma[1,2];
rRB=correlationRB/(sigR*sigB);
rVB=correlationVB/(sigV*sigB);
rVR=correlationVR/(sigV*sigR);
#" Proportions de contraste"
Variance_total=(sigR^2)+(sigB^2)+(sigV^2);
cB=sigB^2/Variance_total;
cV=sigV^2/Variance_total;
cR=sigR^2/Variance_total;
=#

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
