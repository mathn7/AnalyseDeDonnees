#=-------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP2 - Calcul et affichage des donnees bruitees
 Donnees.jl
--------------------------------------------------------------------------
=#
using PyPlot

include("affichage_ellipse.jl")

	
# Parametres de l'ellipse
taille = 20
c = 2*taille/5*(rand(1)[1]+0.25)
a = 2*taille/5*(rand(1)[1]+1)
if a[1]<c[1]
	aux = a
	a = c
	c = aux
end
b = sqrt(a[1]^2-c[1]^2)
C = (taille-a).*(2*rand(2,1).-1)
theta_0 = 2*pi*rand(1)[1]


# Foyers
R = [cos(theta_0) -sin(theta_0) ; sin(theta_0) cos(theta_0)]
F_1 = R*[c ; 0]+C
F_2 = R*[-c ; 0]+C

# Calcul des donnees bruitees
n = 200
theta_donnees_bruitees = 2*pi*rand(1,n).+2*pi*rand(1)
xy_donnees_bruitees = [a*cos.(theta_donnees_bruitees) ; b*sin.(theta_donnees_bruitees)]
xy_donnees_bruitees = R*xy_donnees_bruitees+C*ones(1,n)
sigma = 1
xy_donnees_bruitees = xy_donnees_bruitees+sigma*randn(2,n)
nb_points_ellipse = 100
deux_pi = 2*pi

theta_points_ellipse = collect(deux_pi/nb_points_ellipse:deux_pi/nb_points_ellipse:6.283185307179586)

figure()
axis("equal")
affichage_ellipse(C,theta_0,a,b,theta_points_ellipse,"g-")

# affichage des donnees bruitees
plot(xy_donnees_bruitees[1,:],xy_donnees_bruitees[2,:],"k*",MarkerSize=10,LineWidth=2)
xlabel("x",FontSize=30)
ylabel("y",FontSize=30)
legend(("Ellipse","Données bruitées"),loc="center")

gcf()
	





