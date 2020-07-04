using MAT
using Markdown
@doc doc"""
**TP3 - Classification bayesienne**

Calcul de la couleur moyenne d’une image

# Entrées 
* **afficher** : (Bool) afficher les figures (false dans le runtests.jl)
* **chemin**   : (String) le chemin vers ce fichier

"""
function tp3_exercice1(afficher::Bool,chemin::String)
	
	if afficher
		Gaston.closeall()
	end

	# Chargement des donnees sous forme d'un dictionnaire
	vars = matread(chemin*"mat/donnees.mat")

	nb_images_pensees = Integer(vars["nb_images_pensees"])
	nb_images_oeillets = Integer(vars["nb_images_oeillets"])
	nb_images_chrysanthemes = Integer(vars["nb_images_chrysanthemes"])
	## Calcul des vecteurs de moyenne des images de fleurs
	# Couleur moyenne de chaque image de pensee [fonction a coder]
	X_pensees = zeros(nb_images_pensees,2)
	for i = 1:nb_images_pensees
		im = vars["pe" * string(i)]
		X_pensees[i,:] = tp3_couleur_moyenne(im)
	end

	# Couleur moyenne de chaque image d oeillet [fonction a coder]
	X_oeillets = zeros(nb_images_oeillets,2)
	for i = 1:nb_images_oeillets
		im = vars["oe" * string(i)]
		X_oeillets[i,:] = tp3_couleur_moyenne(im)
	end

	# Couleur moyenne de chaque image de chrysantheme
	X_chrysanthemes = zeros(nb_images_chrysanthemes,2)
	for i = 1:nb_images_chrysanthemes
		im = vars["ch" * string(i)]
		X_chrysanthemes[i,:] = tp3_couleur_moyenne(im)
	end

	## Affichage des couleurs moyennes des images de fleurs

	# Vecteur r et v pour les axes()
	pas = 0.0025
	r = 0.35:pas:0.60
	v = 0.2:pas:0.45
	nb_r = length(collect(r))
	nb_v = length(collect(v))
	# Enregistrer les résultats 
	MAT.matwrite(chemin*"mat/resultats-ex1.mat", Dict(
		"nb_r" => nb_r,
		"nb_v" => nb_v,
		"r" => collect(r), 
		"v" => collect(v), 
		"X_pensees" => X_pensees,
		"X_oeillets" => X_oeillets,
		"X_chrysanthemes" => X_chrysanthemes,
		"nb_images_pensees" => vars["nb_images_pensees"],
		"nb_images_oeillets" => vars["nb_images_oeillets"],
		"nb_images_chrysanthemes" => vars["nb_images_chrysanthemes"]
	))
	if afficher
		plt = Gaston.scatter(X_pensees[:,1], X_pensees[:,2],marker = "fsquare",lw = 5,legend=:"'Pensees'",lc="'#08F7FE'",
			Axes(object="rectangle from screen 0,0 to screen 1,1 behind fc 'black' fs solid noborder",
				border="lw 2 lc 'white'",
				xtics="textcolor rgb 'white'",
				ytics="textcolor rgb 'white'",
				ylabel="'r_{bar}' textcolor 'white'",
				xlabel="'v_{bar}' textcolor 'white'",
				grid="lc '#08F7FE' dt 4",
				key="t r textcolor 'white'"))

		Gaston.plot!(X_oeillets[:,1],X_oeillets[:,2],marker = "+",lw = 5,lc="'#FFE64D'",legend=:"'Oeillets'")
		Gaston.plot!(X_chrysanthemes[:,1],X_chrysanthemes[:,2],marker = "*",lw = 5,lc="'white'",legend=:"'Chrysantemes'")
		
		display(plt)
	end
end	