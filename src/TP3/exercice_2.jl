"""
--------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP3 - Classification bayesienne
 exercice_2.jl
--------------------------------------------------------------------------
"""

using Plots
using MAT
using LinearAlgebra
using LaTeXStrings
include("tapez_entrer.jl")
include("estimation_mu_et_sigma.jl")
include("vraisemblance.jl")

closeall()

# Chargement des donnees de l exercice 1
vars = matread("mat/resultats-ex1.mat")

X_pensees =vars["X_pensees"]
X_oeillets =vars["X_oeillets"]
X_chrysanthemes =vars["X_chrysanthemes"]
nb_r =Integer(vars["nb_r"])
nb_v =Integer(vars["nb_v"])
r =vars["r"]
v =vars["v"]

## Estimation pour les pensees ##

# Estimation des parametres de la loi normale [fonction a coder]
mu_pensees, Sigma_pensees = estimation_mu_et_sigma(X_pensees)
# Valeurs de la loi normale sur la grille
V_pensees, denominateur_classe_pensees = vraisemblance(r, v, mu_pensees, Sigma_pensees, -1)

# Representation 3D de la loi normale
pyplot() # utiliser le backend pyplot de matplotlib
plt = plot(layout=(1,3))
plot!(r,v,V_pensees,st=:wireframe,color=:palegreen,	
	title=" Vraisemblance de la classe des pensees",
	label="Vraisemblance empirique",subplot=1,	
	xlim=(r[1],r[end]),ylim=(v[1],v[end]),
	xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}")

scatter!(X_pensees[:,1],X_pensees[:,2],zeros(length(X_pensees)),markersize=10,
	markerstrokecolor=:green,marker=:star7,color=:green,label="donnees d'apprentissage",subplot=1)

## Estimation pour les oeillets ##

# Estimation des parametres de la loi normale
mu_oeillets, Sigma_oeillets= estimation_mu_et_sigma(X_oeillets)
# Valeurs de la loi normale sur la grille
V_oeillets, denominateur_classe_oeillets = vraisemblance(r, v, mu_oeillets, Sigma_oeillets, -1)

# Representation 3D de la loi normale
plot!(r,v,V_oeillets,st=:wireframe,color=:lightsalmon,
	title="Vraisemblance de la classe des oeillets",
	label="Vraisemblance empirique",subplot=2,
	xlim=(r[1],r[end]),ylim=(v[1],v[end]),
	xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}")

scatter!(X_oeillets[:,1],X_oeillets[:,2],zeros(length(X_oeillets)),markersize=10,
	markerstrokecolor=:red,marker=:star5,c=:red,label="donnees d'apprentissage",subplot=2)
## Estimation pour les chrysanthemes ##

# Estimation des parametres de la loi normale [fonction a coder]
mu_chrysanthemes, Sigma_chrysanthemes = estimation_mu_et_sigma(X_chrysanthemes)
# Valeurs de la loi normale sur la grille
V_chrysanthemes, denominateur_classe_chrysanthemes = vraisemblance(r,v,mu_chrysanthemes,Sigma_chrysanthemes,-1)
# enregistrer les résultats
MAT.matwrite("mat/resultats-ex2.mat", Dict(
	"nb_r" => nb_r,
	"nb_v" => nb_v,
	"r" => collect(r), 
	"v" => collect(v), 
	"X_pensees" => X_pensees,
	"X_oeillets" => X_oeillets,
	"X_chrysanthemes" => X_chrysanthemes,
	"V_pensees"=> V_pensees,
	"V_oeillets"=> V_oeillets,
	"V_chrysanthemes"=> V_chrysanthemes,
	"nb_images_pensees" => vars["nb_images_pensees"],
	"nb_images_oeillets" => vars["nb_images_oeillets"],
	"nb_images_chrysanthemes" => vars["nb_images_chrysanthemes"],
	"mu_pensees"=> mu_pensees,
	"mu_oeillets"=> mu_oeillets,
	"mu_chrysanthemes"=> mu_chrysanthemes,
	"Sigma_pensees"=> Sigma_pensees,
	"Sigma_oeillets"=> Sigma_oeillets,
	"Sigma_chrysanthemes"=> Sigma_chrysanthemes,
	"denominateur_classe_pensees"=> denominateur_classe_pensees,
	"denominateur_classe_oeillets"=> denominateur_classe_oeillets,
	"denominateur_classe_chrysanthemes"=> denominateur_classe_chrysanthemes
))
### TODO : affichage du second label dans la legende

# Representation 3D de la loi normale
plot!(r,v,V_chrysanthemes,st=:wireframe,alpha=0.8,color=:lightblue,
	xlim=(r[1],r[end]),ylim=(v[1],v[end]),
	title="Vraisemblance de la classe des chrysanthemes",
	label="Vraisemblance empirique",subplot=3,
	xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}")

scatter!(X_chrysanthemes[:,1],X_chrysanthemes[:,2],zeros(length(X_chrysanthemes)),
	markersize=10,markerstrokecolor=:blue,marker=:star5,c=:blue,label="donnees d'apprentissage",subplot=3)