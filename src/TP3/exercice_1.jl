
#-------------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# exercice_1.js
#-------------------------------------------------------------------------------

using MAT
using PyPlot

# Chargement des donnees
vars = matread("/home/ziaad/Documents/Documents7/TP AD/TP3/Fournitures/donnees.mat")
extract(vars)
## Calcul des vecteurs de moyenne des images de fleurs

# Couleur moyenne de chaque image de pensee [fonction a coder]
X_pensees = zeros(nb_images_pensees,2)
for i = 1:Integer(nb_images_pensees)-1
	im = eval(parse("pe"Char(48+i)));
	X_pensees[i,:] = moyenneim(im)
	X_pensees[10,:] = moyenneim(eval(parse("pe10")))
end

# Couleur moyenne de chaque image d oeillet [fonction a coder]
X_oeillets = zeros(nb_images_oeillets,2)
for i = 1:Integer(nb_images_oeillets)-1
	im = eval(parse("oe"Char(48+i)));
	X_oeillets[i,:] = moyenneim(im)
	X_oeillets[10,:] = moyenneim(eval(parse("oe10")))
end

# Couleur moyenne de chaque image de chrysantheme 
X_chrysanthemes = zeros(nb_images_chrysanthemes,2)
for i = 1:Integer(nb_images_chrysanthemes)-1
	im = eval(parse("ch"Char(48+i)));
	X_chrysanthemes[i,:] = moyenneim(im)
	X_chrysanthemes[10,:] = moyenneim(eval(parse("ch10")))
end

## Affichage des couleurs moyennes des images de fleurs

# Vecteur r et v pour les axes()
pas = 0.0025
r = 0.35:pas:0.60
v = 0.2:pas:0.45
nb_r = length(collect(r))
nb_v = length(collect(v))

figure("Couleurs moyennes des images",figsize=(30,30));
axis("equal")
xlim(xmin=r[1]) # adjust the xmin
xlim(xmax=r[end]) # adjust the xmax
ylim(ymin=v[1]) # adjust the ymin
ylim(ymax=v[end]) # adjust the ymax
plot(X_pensees[:,1],X_pensees[:,2],"r*",MarkerSize=10,LineWidth=2)
plot(X_oeillets[:,1],X_oeillets[:,2],"g*",MarkerSize=10,LineWidth=2)
plot(X_chrysanthemes[:,1],X_chrysanthemes[:,2],"b*",MarkerSize=10,LineWidth=2)
xlabel("r_bar",FontSize=20);
ylabel("v_bar",FontSize=20);
legend(("Pensees","Oeillets","Chrysantemes"));
