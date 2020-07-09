using MAT
using Markdown
using LaTeXStrings
using Printf
@doc doc"""
**TP3 - Classification bayesienne**

Amélioration du classifieur

# Entrées 
* **afficher** : (Bool) afficher les figures (false dans le runtests.jl)
* **chemin**   : (String) le chemin vers ce fichier

# Sorties 
* **accuracy** : (Float64) l'accuracy du classifieur
"""
function tp3_exercice4(afficher::Bool,chemin::String)
	
	if afficher
		pyplot() # utiliser le backend pyplot de matplotlib
		Plots.closeall() 
	end

	# la fonction pause
	pause(text) = (print(stdout, text); read(stdin, 1); nothing)
	# Chargement des donnees
    vars_ex2 = matread(chemin*"resultats-ex2.mat")
	vars = matread(chemin*"donnees.mat")
	
	nb_images_pensees = Integer(vars["nb_images_pensees"])
	nb_images_oeillets = Integer(vars["nb_images_oeillets"])
	nb_images_chrysanthemes = Integer(vars["nb_images_chrysanthemes"])

    V_pensees = vars_ex2["V_pensees"]
	V_oeillets = vars_ex2["V_oeillets"]
    V_chrysanthemes = vars_ex2["V_chrysanthemes"]
		
	# Vecteur r et v pour les axes
	pas = 0.0025
	r = 0.35:pas:0.60
	v = 0.2:pas:0.45
    nb_r = length(r)
	nb_v = length(v)

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

	## Calcul des vecteurs de moyenne des images
	# Couleur moyenne de chaque image de pensee
	X_pensees = zeros(nb_images_pensees,3)
	for i = 1:nb_images_pensees
		im = vars["pe"*string(i)]
		X_pensees[i,:] = tp3_moyenne_amelioree(im);
	end
	mu_pensees, Sigma_pensees = tp3_estimation_mu_sigma(X_pensees)

	# Couleur moyenne de chaque image d"oeillet
	X_oeillets = zeros(nb_images_oeillets,3)
	for i = 1:nb_images_oeillets
		im = vars["oe"*string(i)]
		X_oeillets[i,:] = tp3_moyenne_amelioree(im);
	end
	mu_oeillets, Sigma_oeillets = tp3_estimation_mu_sigma(X_oeillets)

	# Couleur moyenne de chaque image de chrysantheme
	X_chrysanthemes = zeros(nb_images_chrysanthemes,3)
	for i = 1:nb_images_chrysanthemes
		im = vars["ch"*string(i)]
		X_chrysanthemes[i,:] = tp3_moyenne_amelioree(im);
	end
	mu_chrysanthemes, Sigma_chrysanthemes = tp3_estimation_mu_sigma(X_chrysanthemes)

	# afficher les nouvelles coordonnées des images
	if afficher
		plt = Plots.scatter(X_pensees[:,1],X_pensees[:,2],X_pensees[:,3],color=:red,marker=:star7,markerstrokecolor=:red,markersize=10,
			label="Pensees",title="Couleurs moyennes des images",xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}")

		Plots.scatter!(X_oeillets[:,1],X_oeillets[:,2],X_oeillets[:,3],color=:green,markerstrokecolor=:green,markersize=10,label="Oeillets")
		
		Plots.scatter!(X_chrysanthemes[:,1],X_chrysanthemes[:,2],X_chrysanthemes[:,3], color=:blue,marker=:+, markerstrokecolor=:blue,
			markersize=10,label="Chrysantemes",xlim=(r[1],r[end]),ylim=(v[1],v[end]))
	end
	if afficher
		display(plt)
	end

	## Affichage des couleurs moyennes des images
	
	if afficher
		pause("tapez entrée pour afficher les résultats de la classification")
		print("Classifieur amélioré,                               ")
		# Affichage des classes 
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
		V_classe_pensees,_ = tp3_vraisemblance(x_i,mu_pensees,Sigma_pensees,-1)
		V_classe_oeillets,_ = tp3_vraisemblance(x_i,mu_oeillets,Sigma_oeillets,-1)
		V_classe_chrysanthemes,_ = tp3_vraisemblance(x_i,mu_chrysanthemes,Sigma_chrysanthemes,-1)
		
		if (V_classe_pensees >= V_classe_oeillets) && (V_classe_pensees >= V_classe_chrysanthemes)
			nb_img_bien_classees = nb_img_bien_classees + 1
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
		V_classe_pensees,_ = tp3_vraisemblance(x_i,mu_pensees,Sigma_pensees,-1)
		V_classe_oeillets,_ = tp3_vraisemblance(x_i,mu_oeillets,Sigma_oeillets,-1)
		V_classe_chrysanthemes,_ = tp3_vraisemblance(x_i,mu_chrysanthemes,Sigma_chrysanthemes,-1)
		
		if (V_classe_oeillets >= V_classe_pensees) && (V_classe_oeillets >= V_classe_chrysanthemes)
			nb_img_bien_classees = nb_img_bien_classees + 1
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
		V_classe_pensees,_ = tp3_vraisemblance(x_i,mu_pensees,Sigma_pensees,-1)
		V_classe_oeillets,_ = tp3_vraisemblance(x_i,mu_oeillets,Sigma_oeillets,-1)
		V_classe_chrysanthemes,_ = tp3_vraisemblance(x_i,mu_chrysanthemes,Sigma_chrysanthemes,-1)

		if (V_classe_chrysanthemes >= V_classe_pensees) && (V_classe_chrysanthemes >= V_classe_oeillets)
			nb_img_bien_classees = nb_img_bien_classees + 1
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
		@printf("accuracy : %0.3f",accuracy)
		println("%")
		# Ajout du titre avec le pourcentage des images bien classées
		Plots.scatter!([x],[y],markersize=0,label="", title="Classification par maximum de vraisemblance, "*string(accuracy)[1:4]*"% d'images correctement classées")
	end
	if afficher
		display(plt)
	end
	return accuracy
end
