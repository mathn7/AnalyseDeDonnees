#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# exercice_3.js
#--------------------------------------------------------------------------

using PyPlot
using MAT
using LinearAlgebra
using LaTeXStrings
PyPlot.close()   # close all plot windows

#deuxieme option.
#using Plots

# "Chargement des donnees de l exercice 2"
# Chargement des donnees de l exercice 2
vars = matread("exercice_2.mat")

V_pensees = vars["V_pensees"]
V_oeillets = vars["V_oeillets"]
V_chrysanthemes = vars["V_chrysanthemes"]

X_pensees = vars["X_pensees"]
X_oeillets = vars["X_oeillets"]
X_chrysanthemes = vars["X_chrysanthemes"]

nb_images_pensees = Integer(vars["nb_images_pensees"])
nb_images_oeillets = Integer(vars["nb_images_oeillets"])
nb_images_chrysanthemes = Integer(vars["nb_images_chrysanthemes"])

mu_pensees = vars["mu_pensees"]
mu_oeillets = vars["mu_oeillets"]
mu_chrysanthemes = vars["mu_chrysanthemes"]

inv_Sigma_pensees = vars["inv_Sigma_pensees"]
inv_Sigma_oeillets = vars["inv_Sigma_oeillets"]
inv_Sigma_chrysanthemes = vars["inv_Sigma_chrysanthemes"]

denominateur_classe_pensees = vars["denominateur_classe_pensees"]
denominateur_classe_oeillets = vars["denominateur_classe_oeillets"]
denominateur_classe_chrysanthemes = vars["denominateur_classe_chrysanthemes"]

nb_r = Integer(vars["nb_r"])
nb_v = Integer(vars["nb_v"])
r = vars["r"]
v = vars["v"]
#" Calcul du maximum de vraisemblance ":
V_max = max.(V_pensees,V_oeillets)
V_max = max.(V_max,V_chrysanthemes)
classe_pensees = findall(V_pensees .== V_max)
classe_oeillets = findall(V_oeillets .== V_max)
classe_chrysanthemes = findall(V_chrysanthemes .== V_max)
code_classe = zeros(nb_r,nb_v)
code_classe[classe_pensees] .= 3;
code_classe[classe_oeillets] .= 2;
code_classe[classe_chrysanthemes] .= 1

#" Affichage des classes ":

figure("Classification par maximum de vraisemblance",figsize=(30,30))
    axis("equal")
    xlim(xmin=r[1]) # adjust the xmin
    xlim(xmax=r[end]) # adjust the xmax
    ylim(ymin=v[1]) # adjust the ymin
    ylim(ymax=v[end]) # adjust the ymax
    PyPlot.surf(r,v,code_classe)
    carte_couleurs = [0.8 0.8 0.3 ; 0.8 0.3 0.8 ; 0.3 0.8 0.8]
    ColorMap(carte_couleurs)
    show()
#-------------------------------------------------------------------------------

#"Initialisation des compteurs :"
cpt_images = 0
cpt_images_correctement_classees = 0
#" Comptage des images de pensees correctement classees :"
for i = 1:nb_images_pensees
	global cpt_images = cpt_images+1
	r_i = X_pensees[i,1]
	v_i = X_pensees[i,2]
	x_centre = [r_i ; v_i]-mu_pensees
	V_classe_pensees = exp.(-x_centre.*inv_Sigma_pensees.*transpose(x_centre)/2)/denominateur_classe_pensees
	x_centre = [r_i;v_i]-mu_oeillets
	V_classe_oeillets = exp.(-x_centre.*inv_Sigma_oeillets.*transpose(x_centre)/2)/denominateur_classe_oeillets
	x_centre = [r_i;v_i]-mu_chrysanthemes
	V_classe_chrysanthemes = exp.(-x_centre.*inv_Sigma_chrysanthemes.*transpose(x_centre)/2)/denominateur_classe_chrysanthemes
	if (norm((V_classe_pensees).>=(V_classe_oeillets))==2) && (norm((V_classe_pensees).>=(V_classe_chrysanthemes))==2)
		cpt_images_correctement_classees = cpt_images_correctement_classees+1
		PyPlot.plot3D([r_i],[v_i],"r*",MarkerSize=10,LineWidth=2)
	else
		PyPlot.plot3D([r_i],[v_i],"r*",MarkerSize=10,LineWidth=2)
	end
end

#" Comptage des images d'oeillets correctement classees :"
for i = 1:nb_images_oeillets
	cpt_images = cpt_images+1
	r_i = X_oeillets[i,1]
	v_i = X_oeillets[i,2]
	x_centre = [r_i;v_i]-mu_pensees
	V_classe_pensees = exp.(-x_centre.*inv_Sigma_pensees.*transpose(x_centre)/2)/denominateur_classe_pensees
	x_centre = [r_i;v_i]-mu_oeillets
	V_classe_oeillets = exp.(-x_centre.*inv_Sigma_oeillets.*transpose(x_centre)/2)/denominateur_classe_oeillets
	x_centre = [r_i;v_i]-mu_chrysanthemes
	V_classe_chrysanthemes = exp.(-x_centre.*inv_Sigma_chrysanthemes.*transpose(x_centre)/2)/denominateur_classe_chrysanthemes
	if (norm((V_classe_oeillets.>=V_classe_pensees))==2) && (norm(V_classe_oeillets.>=V_classe_chrysanthemes)==2)
		cpt_images_correctement_classees = cpt_images_correctement_classees+1
		PyPlot.plot3D([r_i],[v_i],4,"k*",MarkerSize=10,LineWidth=2)
	else
		PyPlot.plot3D([r_i],[v_i],4,"k*",MarkerSize=10,LineWidth=2)
	end
end

# Comptage des images de chrysanthemes correctement classees :
for i = 1:nb_images_chrysanthemes
	cpt_images = cpt_images+1
	r_i = X_chrysanthemes[i,1]
	v_i = X_chrysanthemes[i,2]
	x_centre = [r_i;v_i]-mu_pensees
	V_classe_pensees = exp.(-x_centre.*inv_Sigma_pensees.*transpose(x_centre)/2)/denominateur_classe_pensees
	x_centre = [r_i;v_i]-mu_oeillets
	V_classe_oeillets = exp.(-x_centre.*inv_Sigma_oeillets.*transpose(x_centre)/2)/denominateur_classe_oeillets
	x_centre = [r_i;v_i]-mu_chrysanthemes
	V_classe_chrysanthemes = exp.(-x_centre.*inv_Sigma_chrysanthemes.*transpose(x_centre)/2)/denominateur_classe_chrysanthemes
	if (norm(V_classe_chrysanthemes.>=V_classe_pensees)==2) && (norm(V_classe_chrysanthemes.>=V_classe_oeillets)==2)
		cpt_images_correctement_classees = cpt_images_correctement_classees+1
		PyPlot.plot3D([r_i],[v_i],4,"g*",MarkerSize=10,LineWidth=2)
	else
		PyPlot.plot3D([r_i],[v_i],4,"g*",MarkerSize=10,LineWidth=2)
	end
end
gcf()
#"Affichage du pourcentage d'images correctement classees :"
print(string(Integer((100*cpt_images_correctement_classees)/cpt_images))," '% d''images correctement classees")
