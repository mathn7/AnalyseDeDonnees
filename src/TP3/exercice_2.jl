#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# exercice_2.jl
#--------------------------------------------------------------------------

using MAT
using PyPlot
using LinearAlgebra
using LaTeXStrings
using Plots
PyPlot.close()   # close all plot windows
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
r = vars["r"]
v = vars["v"] 

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
figure("Vraisemblance de la classe 'pensees'",figsize=(30,30));
	#axis("equal")
	xlim(xmin=r[1]) # adjust the xmin
	xlim(xmax=r[end]) # adjust the xmax
	ylim(ymin=v[1]) # adjust the ymin
	ylim(ymax=v[end]) # adjust the ymax
	plot_surface(r,v,V_pensees);
	Plots.surface(r[:],v[:],V_pensees[:])
# Superposition des données d apprentissage de la classe 'pensees'
	plot(X_pensees[:,1],X_pensees[:,2],"r*",MarkerSize=10,LineWidth=2)
	xlabel(L"\mathrm{\bar{r}}",FontSize=20)
	ylabel(L"\mathrm{\bar{v}}",FontSize=20)
	title("Estimation pour les pensees",FontSize=20)
	#legend(("Vraisemblance empirique" ,"donnees dapprentissage"))

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
figure(" Vraisemblance de la classe 'oeillets'",figsize=(30,30));
	#axis("equal")
	xlim(xmin=r[1]) # adjust the xmin
	xlim(xmax=r[end]) # adjust the xmax
	ylim(ymin=v[1]) # adjust the ymin
	ylim(ymax=v[end]) # adjust the ymax
	PyPlot.surf(r,v,V_oeillets)
	#Plots.surface(r[:],v[:],V_oeillets[:])

#Trace des donnees d apprentissage de la classe 'oeillets'

	PyPlot.plot(X_oeillets[:,1],X_oeillets[:,2],"go",MarkerSize=10,LineWidth=2)
	xlabel(L"\mathrm{\bar{r}}",FontSize=20)
	ylabel(L"\mathrm{\bar{v}}",FontSize=20)
	title("Estimation pour les oeillets",FontSize=20)
	#legend(("Vraisemblance empirique" ,"donnees dapprentissage"))

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
figure("Vraisemblance de la classe 'chrysanthemes'",figsize=(30,30));
	#axis("equal")
	xlim(xmin=r[1]) # adjust the xmin
	xlim(xmax=r[end]) # adjust the xmax
	ylim(ymin=v[1]) # adjust the ymin
	ylim(ymax=v[end]) # adjust the ymax
	surf(r,v,V_chrysanthemes)
	#Plots.surface(r[:],v[:],V_chrysanthemes[:])
	#Trace des donnees d'apprentissage de la classe 'chrysanthemes'
	plot(X_chrysanthemes[:,1],X_chrysanthemes[:,2],"b+",MarkerSize=10,LineWidth=2)
	xlabel(L"\mathrm{\bar{r}}",FontSize=20)
	ylabel(L"\mathrm{\bar{v}}",FontSize=20)
	title("Estimation pour les chrysanthemes",FontSize=20)
	#legend(("Vraisemblance empirique" ,"donnees dapprentissage"))