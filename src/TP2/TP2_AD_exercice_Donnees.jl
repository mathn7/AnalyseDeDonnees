#=-------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP2 - Calcul et affichage des donnees bruitees
  TP2_AD_exercice_Donnees.jl
--------------------------------------------------------------------------
=#
using PyPlot

#" Parametres de l'ellipse :"
taille = 20;
c = 2*taille/5*(rand(1)+0.25);
a = 2*taille/5*(rand(1)+1);
if a[1]<c[1]
	aux = a;
	a = c;
	c = aux;
end
b = sqrt(a[1]^2-c[1]^2);
C = (taille-a).*(2*rand(2,1)-1);
theta_0 = 2*pi*rand(1);

#" Affichage de l'ellipse :"
nb_points_ellipse = 100;
deux_pi = 2*pi;
theta_points_ellipse = deux_pi/nb_points_ellipse:deux_pi/nb_points_ellipse:deux_pi;

#" Foyers :"
R = [cos(theta_0) -sin(theta_0) ; sin.(theta_0) cos.(theta_0)];
F_1 = R*[c ; 0]+C;
F_2 = R*[-c ; 0]+C;

#" Calcul et affichage des donnees bruitees :"
n = 200;
theta_donnees_bruitees = 2*pi*rand(1,n).+2*pi*rand(1);
xy_donnees_bruitees = [a*cos(theta_donnees_bruitees) ; b*sin(theta_donnees_bruitees)];
xy_donnees_bruitees = R*xy_donnees_bruitees+C*ones(1,n);
sigma = 1;
xy_donnees_bruitees = xy_donnees_bruitees+sigma*randn(2,n);
figure("Affichage des donnees bruitees et l'ellipse estimé",figsize=(30,30));
axis("equal")
PyPlot.scatter(xy_donnees_bruitees[1,:],xy_donnees_bruitees[2,:])
affichage_ellipse(C,theta_0,a,b,theta_points_ellipse);
#PyPlot.scatter(px,py);
echelle = [-taille taille -taille taille];
legend(("Données bruitées","ellipse"));
xlabel("X",FontSize=20)
ylabel("Y",FontSize=20)
title("Affichage des donnees bruitees et l'ellipse estimé",FontSize=20)
