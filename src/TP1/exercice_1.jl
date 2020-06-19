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

ImageView.closeall()

#= "Decompostion des canaux RVB d'une image couleur "=#

I = testimage("mandrill")        #" 1er exemple"

#"Decoupage de l'image en trois canaux et conversion en flottants"
C=channelview(I)
B = colorview(RGB, zeroarray, zeroarray, C[3,:,:]);
R = colorview(RGB, C[1,:,:], zeroarray, zeroarray);
V = colorview(RGB, zeroarray, C[2,:,:], zeroarray);


##" Affichage de l'image RVB et de ses canaux"

#" Affichage de l'image RVB"

#figure("Affichage de l'image RVB et de ses canaux",figsize=(30,30));

grid, frames, canvases = canvasgrid((2,2));
ImageView.imshow(canvases[1,1], testimage("mandrill"))

#" Affichage du canal R"

#figure("Affichage du canal R",figsize=(30,30));
#title("Affichage du canal R ")

ImageView.imshow(canvases[1,2],R)

#" Affichage du canal V"

#figure("Affichage du canal V",figsize=(30,30));
#title("Affichage du canal V")

ImageView.imshow(canvases[2,1],V)

#" Affichage du canal B"

#figure("Affichage du canal B",figsize=(30,30));
#title("Affichage du canal B")

ImageView.imshow(canvases[2,2],Gray.(B))
win = Window(grid)
showall(win)


#" Enregistrement des images des canaux "
#save("TP Analyse de Donnees/canal_R.png",img)
#imwrite(uint8(V),'canal_V.png')
#imwrite(uint8(B),'canal_B.png')

#" Affichage du nuage de pixels dans le repere RVB "

R_gray = Gray.(R)
R_gray_float=convert(Array{Gray{Float64},2},R)
R= Real.(R_gray_float).*100;
B_gray = Gray.(B)
B_gray_float=convert(Array{Gray{Float64},2},B)
B= Real.(B_gray_float).*100;
V_gray = Gray.(V)
V_gray_float=convert(Array{Gray{Float64},2},V)
V= Real.(V_gray_float).*100;

#= " Deuxieme fenetre d affichage  " =#
figure("Nuage de pixels dans le repere RVB ",figsize=(30,30))
title("Representation 3D des pixels dans lespace RVB",FontSize=20)
axis("equal")
xlabel("R")
ylabel("V")
zlabel("B")
PyPlot.surf(R,V,B)

#" Calcul des correlations entre les canaux RVB et des contrastes"

#" Matrice des donnees "

X = [R[:] V[:] B[:]];	#"Les trois canaux sont vectorises et concatenes"

#" Matrice de variance/covariance"

n=length(X)
X_bar= mean(X);
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



