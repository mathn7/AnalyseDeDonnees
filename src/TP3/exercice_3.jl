#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# exercice_3.js
#--------------------------------------------------------------------------

using PyPlot
using MAT
PyPlot.close()   # close all plot windows

#deuxieme option.
#using Plots

# "Chargement des donnees de l exercice 2"
# Chargement des donnees de l exercice 2
vars = matread("/home/ziaad/Documents/Documents7/TP AD/TP3/Fournitures/resultats_ex2.mat")
extract(vars)

#" Calcul du maximum de vraisemblance ":
V_max = max.(V_pensees,V_oeillets);
V_max = max.(V_max,V_chrysanthemes);
classe_pensees = find(V_pensees .== V_max);
classe_oeillets = find(V_oeillets .== V_max);
classe_chrysanthemes = find(V_chrysanthemes .== V_max);
code_classe = zeros(nb_r,nb_v);
code_classe[classe_pensees] = 3;
code_classe[classe_oeillets] = 2;
code_classe[classe_chrysanthemes] = 1;

#" Affichage des classes ":

    figure("Classification par maximum de vraisemblance",figsize=(30,30));
    axis("equal")
    xlim(xmin=r[1]) # adjust the xmin
    xlim(xmax=r[end]) # adjust the xmax
    ylim(ymin=v[1]) # adjust the ymin
    ylim(ymax=v[end]) # adjust the ymax
    PyPlot.surf(r,v,code_classe);
    carte_couleurs = [0.8 0.8 0.3 ; 0.8 0.3 0.8 ; 0.3 0.8 0.8];
    ColorMap(carte_couleurs)
    show()
#-------------------------------------------------------------------------------

#"Initialisation des compteurs :"
cpt_images = 0;
cpt_images_correctement_classees = 0;


#" Comptage des images de pensees correctement classees :"
for i = 1:Integer(nb_images_pensees)
	cpt_images = cpt_images+1;
	r_i = X_pensees[i,1];
	v_i = X_pensees[i,2];
	x_centre = [r_i ; v_i]-mu_pensees;
	V_classe_pensees = exp.(-x_centre.*inv_Sigma_pensees.*transpose(x_centre)/2)/denominateur_classe_pensees;
	x_centre = [r_i;v_i]-mu_oeillets;
	V_classe_oeillets = exp.(-x_centre.*inv_Sigma_oeillets.*transpose(x_centre)/2)/denominateur_classe_oeillets;
	x_centre = [r_i;v_i]-mu_chrysanthemes;
	V_classe_chrysanthemes = exp.(-x_centre.*inv_Sigma_chrysanthemes.*transpose(x_centre)/2)/denominateur_classe_chrysanthemes;
	if (norm((V_classe_pensees).>=(V_classe_oeillets))==2) && (norm((V_classe_pensees).>=(V_classe_chrysanthemes))==2)
		cpt_images_correctement_classees = cpt_images_correctement_classees+1;
		PyPlot.plot3D([r_i],[v_i],"r*",MarkerSize=10,LineWidth=2);
	else
		PyPlot.plot3D([r_i],[v_i],"r*",MarkerSize=10,LineWidth=2);
	end
end

#" Comptage des images d'oeillets correctement classees :"
for i = 1:Integer(nb_images_oeillets)
	cpt_images = cpt_images+1;
	r_i = X_oeillets[i,1];
	v_i = X_oeillets[i,2];
	x_centre = [r_i;v_i]-mu_pensees;
	V_classe_pensees = exp.(-x_centre.*inv_Sigma_pensees.*transpose(x_centre)/2)/denominateur_classe_pensees;
	x_centre = [r_i;v_i]-mu_oeillets;
	V_classe_oeillets = exp.(-x_centre.*inv_Sigma_oeillets.*transpose(x_centre)/2)/denominateur_classe_oeillets;
	x_centre = [r_i;v_i]-mu_chrysanthemes;
	V_classe_chrysanthemes = exp.(-x_centre.*inv_Sigma_chrysanthemes.*transpose(x_centre)/2)/denominateur_classe_chrysanthemes;
	if (norm((V_classe_oeillets.>=V_classe_pensees))==2) && (norm(V_classe_oeillets.>=V_classe_chrysanthemes)==2)
		cpt_images_correctement_classees = cpt_images_correctement_classees+1;
		PyPlot.plot3D([r_i],[v_i],4,"k*",MarkerSize=10,LineWidth=2);
	else
		PyPlot.plot3D([r_i],[v_i],4,"k*",MarkerSize=10,LineWidth=2);
	end
end

#" Comptage des images de chrysanthemes correctement classees :"
for i = 1:Integer(nb_images_chrysanthemes)
	cpt_images = cpt_images+1;
	r_i = X_chrysanthemes[i,1];
	v_i = X_chrysanthemes[i,2];
	x_centre = [r_i;v_i]-mu_pensees;
	V_classe_pensees = exp.(-x_centre.*inv_Sigma_pensees.*transpose(x_centre)/2)/denominateur_classe_pensees;
	x_centre = [r_i;v_i]-mu_oeillets;
	V_classe_oeillets = exp.(-x_centre.*inv_Sigma_oeillets.*transpose(x_centre)/2)/denominateur_classe_oeillets;
	x_centre = [r_i;v_i]-mu_chrysanthemes;
	V_classe_chrysanthemes = exp.(-x_centre.*inv_Sigma_chrysanthemes.*transpose(x_centre)/2)/denominateur_classe_chrysanthemes;
	if (norm(V_classe_chrysanthemes.>=V_classe_pensees)==2) && (norm(V_classe_chrysanthemes.>=V_classe_oeillets)==2)
		cpt_images_correctement_classees = cpt_images_correctement_classees+1;
		PyPlot.plot3D([r_i],[v_i],4,"g*",MarkerSize=10,LineWidth=2);
	else
		PyPlot.plot3D([r_i],[v_i],4,"g*",MarkerSize=10,LineWidth=2);
	end
end

#"Affichage du pourcentage d'images correctement classees :"
print(string(Integer((100*cpt_images_correctement_classees)/cpt_images))," '% d''images correctement classees");
