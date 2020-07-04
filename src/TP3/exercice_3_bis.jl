using MAT
using Markdown
using LaTeXStrings
@doc doc"""
**TP3 - Classification bayesienne**

Classification d’images de fleurs en ajustant les propbabilités *a priori* des classes

# Entrées 
* **afficher** : (Bool) afficher les figures (false dans le runtests.jl)
* **chemin**   : (String) le chemin vers ce fichier

"""
function tp3_exercice3bis(afficher::Bool,chemin::String,proba_apriori::Array{Float64,1})

	if afficher
		Plots.closeall() 
	end

	# Chargement des donnees de l exercice 2
	vars = matread(chemin*"mat/resultats-ex2.mat")

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

	Sigma_pensees = vars["Sigma_pensees"]
	Sigma_oeillets = vars["Sigma_oeillets"]
	Sigma_chrysanthemes = vars["Sigma_chrysanthemes"]

	denominateur_classe_pensees = vars["denominateur_classe_pensees"]
	denominateur_classe_oeillets = vars["denominateur_classe_oeillets"]
	denominateur_classe_chrysanthemes = vars["denominateur_classe_chrysanthemes"]

	nb_r = Integer(vars["nb_r"])
	nb_v = Integer(vars["nb_v"])
	r = vars["r"]
	v = vars["v"]
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

	if afficher
		# Affichage des classes 
		pyplot() # utiliser le backend pyplot de matplotlib

		# les points suivants sont tracés juste pour ajouter leurs labels dans la légende 
		x = X_pensees[nb_images_pensees,1]
		y = X_pensees[nb_images_pensees,2]
		plt = Plots.scatter([x],[y],color=:red,label="pensee bien classée")
		Plots.scatter!([x],[y],color=:white,markerstrokecolor=:red,marker=:xcross,label="pensee pas bien classée")
		Plots.scatter!([x],[y],color=:green,label="oeillet bien classée")
		Plots.scatter!([x],[y],color=:white,markerstrokecolor=:green,marker=:xcross,label="oeillet pas bien classée")
		Plots.scatter!([x],[y],color=:blue,label="chrysantheme bien classée")
		Plots.scatter!([x],[y],color=:white,markerstrokecolor=:blue,marker=:xcross,label="chrysantheme pas bien classée")
		# la carte des couleurs représentant les différentes classes 
		Plots.heatmap!(r,v,code_classe,color=cgrad([:royalblue, :seagreen, :firebrick]),
			xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}",
			xlim=(r[1],r[end]),ylim=(v[1],v[end]))
	end
	#-------------------------------------------------------------------------------

	# Initialisation du compteur des images correctement classées :
	nb_img_bien_classees = 0
	# Comptage des images de pensees correctement classees :

	for i = 1:nb_images_pensees
		x_i = X_pensees[i,:]
        V_classe_pensees,_ = tp3_vraisemblance(x_i,mu_pensees,Sigma_pensees,denominateur_classe_pensees) 
        aposteriori_classe_pensees = V_classe_pensees * proba_apriori[1]

        V_classe_oeillets,_ = tp3_vraisemblance(x_i,mu_oeillets,Sigma_oeillets,denominateur_classe_oeillets) 
        aposteriori_classe_oeillets = V_classe_oeillets * proba_apriori[2]

        V_classe_chrysanthemes,_ = tp3_vraisemblance(x_i,mu_chrysanthemes,Sigma_chrysanthemes,denominateur_classe_chrysanthemes) 
        aposteriori_classe_chrysanthemes = V_classe_chrysanthemes * proba_apriori[3]

		if (aposteriori_classe_pensees >= aposteriori_classe_oeillets) && (aposteriori_classe_pensees >= aposteriori_classe_chrysanthemes)
			nb_img_bien_classees = nb_img_bien_classees+1
			if afficher
				Plots.scatter!([x_i[1]],[x_i[2]],color=:red,markersize=10,label="")
			end
		else
			if afficher
				Plots.scatter!([x_i[1]],[x_i[2]],color=:white,markerstrokecolor=:red,marker=:xcross,markersize=10,label="")
			end
		end
	end

	# Comptage des images d'oeillets correctement classees 
	for i = 1:nb_images_oeillets

		x_i = X_oeillets[i,:]
        V_classe_pensees,_ = tp3_vraisemblance(x_i,mu_pensees,Sigma_pensees,denominateur_classe_pensees) 
        aposteriori_classe_pensees = V_classe_pensees * proba_apriori[1]

        V_classe_oeillets,_ = tp3_vraisemblance(x_i,mu_oeillets,Sigma_oeillets,denominateur_classe_oeillets) 
        aposteriori_classe_oeillets = V_classe_oeillets * proba_apriori[2]

        V_classe_chrysanthemes,_ = tp3_vraisemblance(x_i,mu_chrysanthemes,Sigma_chrysanthemes,denominateur_classe_chrysanthemes) 
        aposteriori_classe_chrysanthemes = V_classe_chrysanthemes * proba_apriori[3]

		
		if (aposteriori_classe_oeillets >= aposteriori_classe_pensees) && (aposteriori_classe_oeillets >= aposteriori_classe_chrysanthemes)
			nb_img_bien_classees = nb_img_bien_classees+1
			if afficher
				Plots.scatter!([x_i[1]],[x_i[2]],color=:green,markersize=10,label="")
			end
		else
			if afficher
				Plots.scatter!([x_i[1]],[x_i[2]],color=:white,markerstrokecolor=:green,marker=:xcross,markersize=10,label="")
			end
		end
	end

	# Comptage des images de chrysanthemes correctement classees :
	for i = 1:nb_images_chrysanthemes

		x_i = X_chrysanthemes[i,:]
        V_classe_pensees,_ = tp3_vraisemblance(x_i,mu_pensees,Sigma_pensees,denominateur_classe_pensees) 
        aposteriori_classe_pensees = V_classe_pensees * proba_apriori[1]

        V_classe_oeillets,_ = tp3_vraisemblance(x_i,mu_oeillets,Sigma_oeillets,denominateur_classe_oeillets) 
        aposteriori_classe_oeillets = V_classe_oeillets * proba_apriori[2]

        V_classe_chrysanthemes,_ = tp3_vraisemblance(x_i,mu_chrysanthemes,Sigma_chrysanthemes,denominateur_classe_chrysanthemes) 
        aposteriori_classe_chrysanthemes = V_classe_chrysanthemes * proba_apriori[3]


		if (aposteriori_classe_chrysanthemes >= aposteriori_classe_pensees) && (aposteriori_classe_chrysanthemes >= aposteriori_classe_oeillets)
			nb_img_bien_classees = nb_img_bien_classees+1
			if afficher
				Plots.scatter!([x_i[1]],[x_i[2]],color=:blue,markersize=10,label="")
			end
		else
			if afficher
				Plots.scatter!([x_i[1]],[x_i[2]],color=:white,markerstrokecolor=:blue,marker=:xcross,markersize=10,label="")
			end
		end
	end
	# l'accuracy en % :
	accuracy = 100 * nb_img_bien_classees / (nb_images_chrysanthemes + nb_images_oeillets + nb_images_pensees)
	
	if afficher
		print(string(accuracy)[1:5]*"% d'images correctement classees")
		# Ajout du titre avec le pourcentage des images bien classées
		Plots.scatter!([x],[y],markersize=0,label="", title="Classification par maximum de vraisemblance, "*string(accuracy)[1:4]*"% d'images correctement classées")
	end
	if afficher
		display(plt)
	end
	return accuracy
end