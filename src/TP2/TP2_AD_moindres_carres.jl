#" Estimation des parametres par les moindres carres ordinaires :"
x = transpose(xy_donnees_bruitees[1,:]);
y = transpose(xy_donnees_bruitees[2,:]);
X_chapeau = MCO(x,y);

C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau = conversion(X_chapeau);

#" Affichage de l'ellipse estimee par MCO :"
figure(" Affichage de l'ellipse estimee par MCO",figsize=(30,30));
axis("equal")
PyPlot.scatter(xy_donnees_bruitees[1,:],xy_donnees_bruitees[2,:])
affichage_ellipse(C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau,theta_points_ellipse);
legend(("Ellipse","Estimation par MCO"));
xlabel("X",FontSize=20)
ylabel("Y",FontSize=20)
title("Affichage des donnees bruitees et l'ellipse estimé par MCO",FontSize=20)


# " Calcul du score de l'ellipse estimee par MCO :"
R_chapeau = [cos.(theta_0_chapeau) -sin.(theta_0_chapeau) ; sin.(theta_0_chapeau) cos.(theta_0_chapeau)];
c_chapeau = sqrt.(a_chapeau*a_chapeau-b_chapeau*b_chapeau);
F_1_chapeau = R_chapeau*[c_chapeau ; 0]+C_chapeau;
F_2_chapeau = R_chapeau*[-c_chapeau ; 0]+C_chapeau;
#print("Score de l''estimation par MCO = %.3f",score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau));
