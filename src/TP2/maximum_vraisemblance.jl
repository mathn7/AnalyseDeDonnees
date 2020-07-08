using LinearAlgebra
using PyPlot
using MAT

include("score.jl")
include("Donnees.jl")
include("MV.jl")



#" Definition des intervalles pour les tirages aleatoires :"
x_min = minimum(xy_donnees_bruitees[1,:])
x_max = maximum(xy_donnees_bruitees[1,:])
delta_x = x_max-x_min
y_min = minimum(xy_donnees_bruitees[2,:])
y_max = maximum(xy_donnees_bruitees[2,:])
delta_y = y_max-y_min
a_max = sqrt(delta_x^2+delta_y^2)/2

# "Tirage de valeurs aleatoires pour les parametres :"
nb_tirages = 10000
x_F_aleatoire = x_min .+ (x_max-x_min)*rand(2,nb_tirages)
y_F_aleatoire = y_min .+ (y_max-y_min)*rand(2,nb_tirages)
a_aleatoire = a_max*rand(1,nb_tirages)

#"fonction Maximum vraisemblance"
F_1_chapeau,F_2_chapeau,a_chapeau = MV(xy_donnees_bruitees,x_F_aleatoire,y_F_aleatoire,a_aleatoire)

# "Estimation des parametres par le maximum de vraisemblance :"
C_chapeau = (F_1_chapeau+F_2_chapeau)/2
F_2_chapeau_F_1_chapeau = F_1_chapeau-F_2_chapeau
theta_0_chapeau = atan(F_2_chapeau_F_1_chapeau[2]/F_2_chapeau_F_1_chapeau[1])
c_chapeau = sqrt(F_2_chapeau_F_1_chapeau[1]^2+F_2_chapeau_F_1_chapeau[1]^2)/2
b_chapeau = sqrt(a_chapeau*a_chapeau-c_chapeau*c_chapeau)

#" Affichage de l'ellipse reelle et des donnees bruitees et de l'ellipse estimee par MV :"
affichage_ellipse(C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau,theta_points_ellipse,"b-")
legend(("Ellipse","Donnees bruitees","Estimation par MV"),loc="center")

# " Calcul du score de l'ellipse estimee par MV :"
println("Score de l'éstimation par MV = ",score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau))
gcf()
