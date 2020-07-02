#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP1 - Espace de representation des couleurs
# Exercice_2.m
#--------------------------------------------------------------------------

#importation des bibliothèques


#using PyPlot, Gtk.ShortNames , ImageView #à décommenter pour l'affichage
#using TestImages , ImageMagick #à décommenter pour utiliser des images disponibles dans ImageMagic
using Images
using LinearAlgebra
using Statistics
using Printf

include("exercice_1.jl")

## ########## Calcul des composantes principales d'une image RVB #########

@doc doc"""
# Syntaxe
```julia
C = Composantes_principales(Im)
```
# Entrée :
   * **Im**   : (Array{RGBA{Normed{UInt8,8}},2}) matrice representatrice l'image
# Sortie:
   * **C**    : (Array{Float64,2})  la matrice qui contient les composantes principales en colonnes
"""

function Composantes_principales(Im)
    X_c = Donnees_centrees(Im) #Im : matrice representatrice l'image
    (n,p)= size(X_c);
    Sigma = Matrice_var_cov(Im)
    # Calcul des valeurs/vecteurs propres de Sigma
    D,W = eigen(Sigma)
    #Tri des valeurs propres dans l'ordre décroissant:
    indices=sortperm(D,rev=true)
    #Calcul des composantes principales et des coefficients de projection
    W = W[:,indices];   # Permutation des colonnes de W
    C = X_c*W          # Changement d'axes du repere
    return C
end

@doc doc"""
# Syntaxe
```julia
Sigma_2 = Sigma2(Im)
```
# Entrée :
   * **Im**   : (Array{RGBA{Normed{UInt8,8}},2}) matrice representatrice l'image
# Sortie:
   * **Sigma_2**    : (Array{Float64,2})   Matrice de variance/covariance dans le nouveau repere
"""

function Sigma2(Im)
    C = Composantes_principales(Im);
    n = size(C)[1]
    return (C')*C/n
end

#Entrée : matrice representatrice l'image

function affichages_2(Im)
    #nettoyer l'environnement
    ImageView.closeall()
    clf() #à commenter si vous n'êtes pas sous Atom

    C = Composantes_principales(Im);
    C1 = reshape(C[:,1],size(Im))
    C2 = reshape(C[:,2],size(Im))
    C3 = reshape(C[:,3],size(Im))
    ##  ####### Affichage de l'image RVB et de ses composantes principales #######
    gui = imshow_gui((300,300),(2, 2))  # La fenetre comporte 2 lignes et 2 colonnes (affichage 300×300)
    # 1ere fenetre d'affichage
    canvases = gui["canvas"]
    # Affichage de l'image RVB
    ImageView.imshow(canvases[1,1], Im) # 1ere ligne, 1ere colonne
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
    PyPlot.figure("Nuage de pixels dans le repere des composantes principales",figsize=(30,30))
    PyPlot.scatter3D(C1,C2,C3,"r*")
    PyPlot.xlabel("1ere CP",FontWeight=20)
    PyPlot.ylabel("2eme CP",FontWeight=20)
    PyPlot.zlabel("3eme CP",FontWeight=20)
    PyPlot.title("Representation 3D des pixels dansl''espace des composantes principales",FontWeight=20)

    #Matrice de variance/covariance dans le nouveau repere
    Sigma_2 = Sigma2(Im)
    ## Calcul des correlations entre les composantes principales et des contrastes
    # Coefficients de correlation lineai<re
    @printf("Correlation r[C1,C2] = %0.3f\n",Sigma_2[1,2]/sqrt(Sigma_2[1,1]*Sigma_2[2,2]))
    @printf("Correlation r[C1,C3] = %0.3f\n",Sigma_2[1,3]/sqrt(Sigma_2[1,1]*Sigma_2[3,3]))
    @printf("Correlation r[C2,C3] = %0.3f\n",Sigma_2[2,3]/sqrt(Sigma_2[2,2]*Sigma_2[3,3]))
    # Proportions de contraste
    c = sum(Sigma_2)
    @printf("Proportion de contraste dans le canal C1 = %0.3f\n",Sigma_2[1,1]/c)
    @printf("Proportion de contraste dans le canal C2 = %0.3f\n",Sigma_2[2,2]/c)
    @printf("Proportion de contraste dans le canal C3 = %0.3f\n",Sigma_2[3,3]/c)

    gcf() #à commenter si vous n'êtes pas sous Atom
end
