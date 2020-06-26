using LinearAlgebra
using PyPlot
using MAT

include("Donnees.jl")
include("MCO.jl")
include("MV.jl")
include("maximum_vraisemblance.jl")
include("score.jl")
include("conversion.jl")




#" Estimation des parametres par les moindres carres ordinaires :"
x = transpose(xy_donnees_bruitees[1,:])
y = transpose(xy_donnees_bruitees[2,:])
X_chapeau = MCO(x,y)
C_chapeau, theta_0_chapeau, a_chapeau, b_chapeau = conversion(X_chapeau)


#" Affichage de l'ellipse estimee par MCO :"
affichage_ellipse(C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau,theta_points_ellipse)
legend(("Ellipse","Donnees bruitees","Estimation par MV","Estimation par MCO"),loc="center")


# " Calcul du score de l'ellipse estimee par MCO :"
R_chapeau = [cos.(theta_0_chapeau) -sin.(theta_0_chapeau) ; sin.(theta_0_chapeau) cos.(theta_0_chapeau)]
c_chapeau = sqrt.(a_chapeau*a_chapeau-b_chapeau*b_chapeau)
F_1_chapeau = R_chapeau*[c_chapeau ; 0]+C_chapeau
F_2_chapeau = R_chapeau*[-c_chapeau ; 0]+C_chapeau
Score = score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau);
println("Score de l''estimation par MCO = ",Score)


MAT.matwrite("/home/viet/Stage2A/Projet-CSAD/src/TP2/score-exo1.mat", Dict(
	"score" => Score
))

gcf()
