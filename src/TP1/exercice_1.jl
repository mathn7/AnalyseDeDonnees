#=-------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP1 - Espace de representation des couleurs
  Exercice_1.js
--------------------------------------------------------------------------
=#

#importation des bibliothèques

#using PyPlot,Plots, Gtk.ShortNames , ImageView #à décommenter pour l'affichage
#using TestImages , ImageMagick #à décommenter pour utiliser des images disponibles dans ImageMagic
using Images
using Statistics
using Printf
using LinearAlgebra

@doc doc"""
# Syntaxe
```julia
X = Matrice_de_donnees(Im)
```
# Entrée :
   * **Im**   : (Array{RGBA{Normed{UInt8,8}},2}) matrice representatrice l'image
# Sortie:
   * **X**    : (Array{Float32,2}) la matrice des données
"""
function tp1_Matrice_de_donnees(Im)
    #Decoupage de l'image en trois canaux et conversion en flottants
    C = channelview(Im);
    R = float(C[1,:,:]);
    V = float(C[2,:,:]);
    B = float(C[3,:,:]);
    # Matrice des donnees
    X = [R[:] V[:] B[:]];	#Les trois canaux sont vectorises et concatenes
    return X
end

@doc doc"""
# Syntaxe
```julia
x_barre = Individu_moyen(Im)
```
# Entrée :
   * **Im**   : (Array{RGBA{Normed{UInt8,8}},2}) matrice representatrice l'image
# Sortie:
   * **x_barre**    : (Array{Float64,2})  l'individu moyen
"""
function tp1_Individu_moyen(Im)
    (n,p)= size(tp1_Matrice_de_donnees(Im));
    return tp1_Matrice_de_donnees(Im)'*ones(n,1)/n;
end

@doc doc"""
# Syntaxe
```julia
X_c = Donnees_centrees(Im)
```
# Entrée :
   * **Im**   : (Array{RGBA{Normed{UInt8,8}},2}) matrice representatrice l'image
# Sortie:
   * **X_c**    : (Array{Float64,2})  matrice des données centrés
"""
function tp1_Donnees_centrees(Im)
    (n,p)= size(tp1_Matrice_de_donnees(Im));
    return tp1_Matrice_de_donnees(Im)-ones(n,1)*tp1_Individu_moyen(Im)';
end

@doc doc"""
# Syntaxe
```julia
Sigma = Matrice_var_cov(Im)
```
# Entrée :
   * **Im**   : (Array{RGBA{Normed{UInt8,8}},2}) matrice representatrice l'image
# Sortie:
   * **Sigma**    : (Array{Float64,2})  la matrice de variance/covariance des variables aléatoires
"""
function tp1_Matrice_var_cov(Im)
    (n,p)= size(tp1_Matrice_de_donnees(Im));
    return (tp1_Donnees_centrees(Im)')*tp1_Donnees_centrees(Im)/n;
end

#Entrée : matrice representatrice l'image

function affichages(Im)

    "#Decoupage de l'image en trois canaux et conversion en flottants"
    C = channelview(Im);
    R = float(C[1,:,:]);
    V = float(C[2,:,:]);
    B = float(C[3,:,:]);

    #nettoyer l'environnement
    ImageView.closeall()

    #Utilisation de Plots pour l'affichage des images
    #=plt = Plots.plot(
        axis=nothing,
        showaxis=false,
        layout = (2,2)
    )
    Plots.plot!(plt[1], Im, ratio=1,title="ImageRVB",titlefontsize=4)
    Plots.plot!(plt[2], RGB.(R), ratio=1,title="Canal R",titlefontsize=4)
    Plots.plot!(plt[3], RGB.(V), ratio=1,title="Canal V",titlefontsize=4)
    Plots.plot!(plt[4], RGB.(B), ratio=1,title="Canal B",titlefontsize=4)
    display(plt)
    =#

    gui = imshow_gui((300,300),(2, 2))  # La fenetre comporte 2 lignes et 2 colonnes (affichage 300×300)
    canvases = gui["canvas"]

    #Utilisation de ImageView
    "###### Affichage de l'image RVB et de ses canaux  #######"

    "# Affichage de l'image RVB"

    ImageView.imshow(canvases[1,1], Im) #1ere ligne ,1ere colonne

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

   "# Coefficients de correlation lineaire"
   Sigma = tp1_Matrice_var_cov(Im) #Matrice de variance/covariance

   @printf("Correlation r(R,V) = %0.3f\n",Sigma[1,2]/sqrt(Sigma[1,1]*Sigma[2,2]));
   @printf("Correlation r(R,B) = %0.3f\n",Sigma[1,3]/sqrt(Sigma[1,1]*Sigma[3,3]));
   @printf("Correlation r(V,B) = %0.3f\n",Sigma[2,3]/sqrt(Sigma[2,2]*Sigma[3,3]));

   "# Proportions de contraste"

   c = sum(diag(Sigma));
   @printf("Proportion de contraste dans le canal R = %0.3f\n",Sigma[1,1]/c);
   @printf("Proportion de contraste dans le canal V = %0.3f\n",Sigma[2,2]/c);
   @printf("Proportion de contraste dans le canal B = %0.3f\n",Sigma[3,3]/c);

    "#Affichage du nuage de pixels dans le repere RVB "

    #Utilisation de Plots
    plt3d= Plots.plot(R,V,B,
                   seriestype=:scatter,xlab="R",ylab="V",zlab="B",legend=false,title="Representation 3D des pixels dans lespace RVB")

    display(plt3d)


end
