
# Choix des images parmi les 37 individus et 6 postures faciales :
numeros_individus = [2, 4, 6, 37]
numeros_postures = [1, 2, 3, 4]

# Chargement et conversion des images
chemin = "./Images_Projet_2020"
X = []
for i in numeros_individus
     for j in numeros_postures
         fichier = chemin * "/" * string(i+3) * "-" * string(j) * ".jpg"
         Im = importdata(fichier)
         I=rgb2gray(Im)
         I=im2double(I)
         X=[X I(:)]
    end
end

# Nombre de lignes n de X (nombre d"images selectionnees) :
 nb_individus = length(numeros_individus)
 nb_postures = length(numeros_postures)
 n = nb_individus*nb_postures
 
 # Dimensions des images
nb_lignes= 480
nb_colonnes = 640
p = nb_lignes*nb_colonnes


# Affichage des images (un individu par ligne, une posture par colonne) :
for l = 1:n
	j = numeros_individus(floor((l-1)/nb_postures)+1)
	k = numeros_postures(mod((l-1),nb_postures)+1)
	img = reshape(X(l,:),nb_lignes,nb_colonnes)
	subplot(nb_individus,nb_postures,l)
	imagesc(img)
	# title(sprintf("Ind. %s, Post. %s",num2str(j,"%2d"),num2str(k,"%1d")),"Fontsize",15)
end

# save donnees
