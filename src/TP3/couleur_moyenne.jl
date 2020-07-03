@doc doc"""
**TP3 - Classification bayesienne**

Calcule la couleur moyenne d'une image

# Entrée
* **image** : l'image

# Sortie
* **[r\_bar, v\_bar]** : les deux composantes moyenne (rouge & vert) de couleur normalisées ``(\bar{r},\bar{v})``

"""
function couleur_moyenne(image)

	image = float(image)

	B = image[:,:,3]
	R = image[:,:,1]
	V = image[:,:,2]

	r = R ./ max.(1,R + V + B)
	v = V ./ max.(1,R + V + B)

	r_bar = mean(r[:])
	v_bar = mean(v[:])
	
	return [r_bar, v_bar]
end
