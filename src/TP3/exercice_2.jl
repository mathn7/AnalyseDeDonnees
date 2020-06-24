#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# exercice_2.jl
#--------------------------------------------------------------------------

using MAT
using LinearAlgebra
using LaTeXStrings
using Plots
closeall()   # close all plot windows
include("tapez_entrer.jl")
include("estimation_mu_Sigma.jl")

# Chargement des donnees de l exercice 1
vars = matread("exercice_1.mat")
azimuth = -72
elevation = 42
# récupérer les données du dictionnaire
X_pensees = vars["X_pensees"]
X_oeillets = vars["X_oeillets"]
X_chrysanthemes = vars["X_chrysanthemes"]
nb_r = Integer(vars["nb_r"])
nb_v = Integer(vars["nb_v"])
r = vars["r"][:]
v = vars["v"][:]

## Estimation pour les pensees

# Estimation des parametres de la loi normale [fonction a coder]
mu_pensees,Sigma_pensees = estimation_mu_Sigma(X_pensees)
inv_Sigma_pensees = inv(Sigma_pensees);
# Valeurs de la loi normale sur la grille
V_pensees = zeros(nb_r,nb_v)
for i = 1:nb_r
	for j = 1:nb_v
		x_centre = [r[i];v[j]]-mu_pensees
		V_pensees[j,i] =exp.(-(transpose(x_centre)) * (Sigma_pensees \ x_centre) / 2)[1, 1]
	end
end

# Normalisation de la loi normale
denominateur_classe_pensees = 2 * pi * sqrt(det(Sigma_pensees))
V_pensees = V_pensees / denominateur_classe_pensees

# Representation 3D de la loi normale
#figure();#figure("Vraisemblance de la classe 'pensees'",figsize=(30,30));
#axis("equal")
#xlim(xmin=r[1])
#xlim(xmax=r[end])
#ylim(ymin=v[1])
#ylim(ymax=v[end])
pyplot();
plt = plot(layout=(1,3))

labels = ["Vraisemblance empirique","donnees d'apprentissage"]
plot!(r,v,V_pensees,st=:wireframe,color=:palegreen,	
	title=" Vraisemblance de la classe des pensees",
	label="Vraisemblance empirique",subplot=1,	
	xlim=(r[1],r[end]),ylim=(v[1],v[end]),
	xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}")

scatter!(X_pensees[:,1],X_pensees[:,2],zeros(length(X_pensees)),markersize=10,
	markerstrokecolor=:green,marker=:star7,color=:green,label="donnees d'apprentissage",subplot=1)

#=
Gaston.surf(r,v,V_pensees,lc = :red,
	pointtype ="dot",ms=3,
	legend=:Vraisemblance_empirique,
	Axes(title=:"'Estimation pour les pensees'",
	xlabel = :r_bar,
	ylabel = :v_bar,
	hidden3d = :on))
# Superposition des données d apprentissage de la classe 'pensees'
Gaston.surf!(X_pensees[:,1],X_pensees[:,2],zeros(length(X_pensees)),
	pointtype = "fdmd",lw = 3,
	legend=:donnees_dapprentissage,
	lc = :red)#,"r*",MarkerSize=10,LineWidth=2)
=#
# attendre 
## Estimation pour les oeillets

# Estimation des parametres de la loi normal
mu_oeillets,Sigma_oeillets= estimation_mu_Sigma(X_oeillets);
inv_Sigma_oeillets = inv(Sigma_oeillets);
# Valeurs de la loi normale sur la grille
V_oeillets = zeros(nb_r,nb_v)
for i = 1:Integer(nb_r)
	for j = 1:Integer(nb_v)
		x_centre = [r[i];v[j]]-mu_oeillets
		V_oeillets[j,i] = exp.(-(transpose(x_centre))*(Sigma_oeillets\x_centre)/2)[1,1]
	end
end

# Normalisation de la loi normale
denominateur_classe_oeillets = 2*pi*sqrt(det(Sigma_oeillets))
V_oeillets = V_oeillets/denominateur_classe_oeillets

# Representation 3D de la loi normale
#figure();#figure(" Vraisemblance de la classe 'oeillets'",figsize=(30,30));
#axis("equal")
#xlim(xmin=r[1]) # adjust the xmin
#xlim(xmax=r[end]) # adjust the xmaxs
#ylim(ymin=v[1]) # adjust the ymin
#ylim(ymax=v[end]) # adjust the ymax
plot!(plt[2],r,v,V_oeillets,st=:wireframe,color=:lightsalmon,
	title="Vraisemblance de la classe des oeillets",
	label="Vraisemblance empirique",subplot=2,
	xlim=(r[1],r[end]),ylim=(v[1],v[end]),
	xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}")

scatter!(plt[2],X_oeillets[:,1],X_oeillets[:,2],zeros(length(X_oeillets)),markersize=10,
	markerstrokecolor=:red,marker=:star7,c=:red,label="donnees d'apprentissage",subplot=2)
#=Gaston.surf(r,v,V_oeillets,lc = :blue,
	pointtype ="dot",ms=5,
	legend=:Vraisemblance_empirique,
	Axes(title=:"'Estimation pour les oeillets'",
	xlabel = :r_bar,
	ylabel = :v_bar,
	hidden3d = :on))
#Trace des donnees d apprentissage de la classe 'oeillets'

Gaston.surf!(X_oeillets[:,1],X_oeillets[:,2],zeros(length(X_oeillets)),
	pointtype = "fdmd",lw = 3,
	legend=:donnees_dapprentissage,
	lc = :blue)
=#
# attendre 
## Estimation pour les chrysanthemes

# Estimation des parametres de la loi normale [fonction a coder]
mu_chrysanthemes,Sigma_chrysanthemes = estimation_mu_Sigma(X_chrysanthemes)
inv_Sigma_chrysanthemes = inv(Sigma_chrysanthemes);

# Valeurs de la loi normale sur la grille
V_chrysanthemes = zeros(nb_r,nb_v)
for i = 1:Integer(nb_r)
	for j = 1:Integer(nb_v)
		x_centre = [r[i];v[j]]-mu_chrysanthemes
		V_chrysanthemes[j,i] = exp.(-(transpose(x_centre))*(Sigma_chrysanthemes\x_centre)/2)[1,1]
	end
end

# Normalisation de la loi normale
denominateur_classe_chrysanthemes = 2*pi*sqrt(det(Sigma_chrysanthemes))
V_chrysanthemes = V_chrysanthemes/denominateur_classe_chrysanthemes

# Representation 3D de la loi normale
#figure();#figure("Vraisemblance de la classe 'chrysanthemes'",figsize=(30,30));
#axis("equal")
#xlim(xmin=r[1]) # adjust the xmin
#xlim(xmax=r[end]) # adjust the xmax
#ylim(ymin=v[1]) # adjust the ymin
#ylim(ymax=v[end]) # adjust the ymax

plot!(plt[3],r,v,V_chrysanthemes,st=:wireframe,alpha=0.8,color=:lightblue,
	xlim=(r[1],r[end]),ylim=(v[1],v[end]),
	title="Vraisemblance de la classe des chrysanthemes",
	label="Vraisemblance empirique",subplot=3,
	xlabel=L"\mathrm{\bar{r}}",ylabel=L"\mathrm{\bar{v}}")

scatter!(plt[3],X_chrysanthemes[:,1],X_chrysanthemes[:,2],zeros(length(X_chrysanthemes)),
	markersize=10,markerstrokecolor=:blue,marker=:star5,c=:blue,label="donnees d'apprentissage",subplot=3)
#=
Gaston.surf(r,v,V_chrysanthemes,lc = :green,
	pointtype ="dot",ms=5,
	legend=:Vraisemblance_empirique,
	Axes(title=:"'Estimation pour les chrysanthemes'",
	xlabel = :r_bar,
	ylabel = :v_bar,
	hidden3d = :on))
#Trace des donnees d'apprentissage de la classe 'chrysanthemes'
Gaston.surf!(X_chrysanthemes[:,1],X_chrysanthemes[:,2],zeros(length(X_chrysanthemes)),
	pointtype = "fdmd",lw = 3,
	legend=:donnees_dapprentissage,
	lc = :green)
#,"b+",MarkerSize=10,LineWidth=2)
=#