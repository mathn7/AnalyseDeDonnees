#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# exercice_3.jl
#--------------------------------------------------------------------------

using Plots
using MAT
using LinearAlgebra
using LaTeXStrings

closeall() 

#deuxieme option.

# Chargement des donnees de l exercice 2
vars = matread("resultats_ex2.mat")

V_pensees = vars["V_pensees"]
V_oeillets = vars["V_oeillets"]
V_chrysanthemes = vars["V_chrysanthemes"]

X_pensees = vars["X_pensees"]
X_oeillets = vars["X_oeillets"]
X_chrysanthemes = vars["X_chrysanthemes"]

nb_images_pensees = Integer(vars["nb_images_pensees"])
nb_images_oeillets = Integer(vars["nb_images_oeillets"])
nb_images_chrysanthemes = Integer(vars["nb_images_chrysanthemes"])

mu_pensees = vars["mu_pensees"][:]
mu_oeillets = vars["mu_oeillets"][:]
mu_chrysanthemes = vars["mu_chrysanthemes"][:]

Sigma_pensees = vars["Sigma_pensees"]
Sigma_oeillets = vars["Sigma_oeillets"]
Sigma_chrysanthemes = vars["Sigma_chrysanthemes"]

denominateur_classe_pensees = vars["denominateur_classe_pensees"]
denominateur_classe_oeillets = vars["denominateur_classe_oeillets"]
denominateur_classe_chrysanthemes = vars["denominateur_classe_chrysanthemes"]

nb_r = Integer(vars["nb_r"])
nb_v = Integer(vars["nb_v"])
r = vars["r"][:]
v = vars["v"][:]
# Calcul du maximum de vraisemblance 
V_max = max.(V_pensees,V_oeillets)
V_max = max.(V_max,V_chrysanthemes)
classe_pensees = findall(V_pensees .== V_max)
classe_oeillets = findall(V_oeillets .== V_max)
classe_chrysanthemes = findall(V_chrysanthemes .== V_max)
code_classe = zeros(nb_r,nb_v)
code_classe[classe_pensees] .= 3
code_classe[classe_oeillets] .= 2
code_classe[classe_chrysanthemes] .= 1

# Affichage des classes 

pyplot()
# ajout des label de la  legend

x = X_pensees[nb_images_pensees,1]
y = X_pensees[nb_images_pensees,2]
scatter([x],[y],color=:red,markersize=10,label="pensee bien classée")
scatter!([x],[y],color=:white,markerstrokecolor=:red,marker=:xcross,markersize=10,label="pensee pas bien classée")
scatter!([x],[y],color=:green,markersize=10,label="oeillet bien classée")
scatter!([x],[y],color=:white,markerstrokecolor=:green,marker=:xcross,markersize=10,label="oeillet pas bien classée")
scatter!([x],[y],color=:blue,markersize=10,label="chrysantheme bien classée")
scatter!([x],[y],color=:white,markerstrokecolor=:blue,marker=:xcross,markersize=10,label="chrysantheme pas bien classée")

heatmap!(r,v,code_classe,color=cgrad([:royalblue, :seagreen, :firebrick]),
	xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}",
	xlim=(r[1],r[end]),ylim=(v[1],v[end]))
#-------------------------------------------------------------------------------

#Initialisation des compteurs :
cpt_images = 0
cpt_images_correctement_classees = 0
# Comptage des images de pensees correctement classees :
for i = 1:nb_images_pensees
	global cpt_images = cpt_images + 1
	r_i = X_pensees[i,1]
	v_i = X_pensees[i,2]
	x_centre = [r_i ; v_i]-mu_pensees
	V_classe_pensees = exp.(-x_centre'*(Sigma_pensees \ x_centre)/2)/denominateur_classe_pensees
	x_centre = [r_i;v_i]-mu_oeillets
	V_classe_oeillets = exp.(-x_centre'*(Sigma_oeillets \ x_centre)/2)/denominateur_classe_oeillets
	x_centre = [r_i;v_i]-mu_chrysanthemes
	V_classe_chrysanthemes = exp.(-x_centre'*(Sigma_chrysanthemes \ x_centre)/2)/denominateur_classe_chrysanthemes
	if (V_classe_pensees >= V_classe_oeillets) && (V_classe_pensees >= V_classe_chrysanthemes)
		global cpt_images_correctement_classees = cpt_images_correctement_classees+1
		scatter!([r_i],[v_i],color=:red,markersize=10,label="pensee bien classée")
	else
		scatter!([r_i],[v_i],color=:white,markerstrokecolor=:red,marker=:xcross,markersize=10,label="pensee pas bien classée")
	end
end

# Comptage des images d'oeillets correctement classees 
for i = 1:nb_images_oeillets
	global cpt_images = cpt_images + 1
	r_i = X_oeillets[i,1]
	v_i = X_oeillets[i,2]

	x_centre = [r_i;v_i]-mu_pensees
	V_classe_pensees = exp.(-x_centre'*(Sigma_pensees \ x_centre)/2)/denominateur_classe_pensees

	x_centre = [r_i;v_i]-mu_oeillets
	V_classe_oeillets = exp.(-x_centre'*(Sigma_oeillets \ x_centre)/2)/denominateur_classe_oeillets

	x_centre = [r_i;v_i]-mu_chrysanthemes
	V_classe_chrysanthemes = exp.(-x_centre'*(Sigma_chrysanthemes \ x_centre)/2)/denominateur_classe_chrysanthemes
	
	if (V_classe_oeillets >= V_classe_pensees) && (V_classe_oeillets >= V_classe_chrysanthemes)
		global cpt_images_correctement_classees = cpt_images_correctement_classees+1
		scatter!([r_i],[v_i],color=:green,markersize=10,label="oeillet bien classée")
	else
		scatter!([r_i],[v_i],color=:white,markerstrokecolor=:green,marker=:xcross,markersize=10,label="oeillet bien classée")
	end
end

# Comptage des images de chrysanthemes correctement classees :
dernierpt = "blue"
for i = 1:nb_images_chrysanthemes
	global cpt_images = cpt_images + 1
	r_i = X_chrysanthemes[i,1]
	v_i = X_chrysanthemes[i,2]	

	x_centre = [r_i;v_i]-mu_pensees
	V_classe_pensees = exp.(-x_centre'*(Sigma_pensees \ x_centre)/2)/denominateur_classe_pensees

	x_centre = [r_i;v_i]-mu_oeillets
	V_classe_oeillets = exp.(-x_centre'*(Sigma_oeillets \ x_centre)/2)/denominateur_classe_oeillets

	x_centre = [r_i;v_i]-mu_chrysanthemes
	V_classe_chrysanthemes = exp.(-x_centre'*(Sigma_chrysanthemes \ x_centre)/2)/denominateur_classe_chrysanthemes

	if (V_classe_chrysanthemes >= V_classe_pensees) && (V_classe_chrysanthemes >= V_classe_oeillets)
		global cpt_images_correctement_classees = cpt_images_correctement_classees+1
		scatter!([r_i],[v_i],color=:blue,markersize=10,label="chrysantheme bien classée")
		dernierpt = "blue"
	else
		scatter!([r_i],[v_i],color=:white,markerstrokecolor=:blue,marker=:xcross,markersize=10,label="chrysantheme pas bien classée")
		dernierpt = "white"
	end
end
# l'accuracy en % :
accuracy = 100*cpt_images_correctement_classees/cpt_images
print(accuracy,"% d'images correctement classees")
# Ajout du titre avec le pourcentage des images bien classées
scatter!([x],[y],	color=dernierpt,markersize=0,label="", title="Classification par maximum de vraisemblance "*string(accuracy)[1:4]*"% d'images correctement classées")