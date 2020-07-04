@doc doc"""
**TP3 - Classification bayesienne**

Calcule les trois valeurs décrivant l'image ``(\bar{r},\bar{v},\bar{r}_{C})``

# Entrées 
* **I** : l'image

# Sorties 
* **[r\_bar\_P, v\_bar\_P, r\_bar\_C]** : ``(\bar{r},\bar{v})`` calculées sur le pourtour P et la valeur ``\bar{r}_{C}`` calculée sur le centre C

"""
function tp3_moyenne_amelioree(image)

    # Conversion au format flottants
    image = float(image)
    
    # Calcul des masques de centre et pourtour
    ratio = 0.3  # (le rayon du centre) / (le rayon de l'image)
    (m,n) = size(image)
    C = image*0
    centre = Integer.(round.([m/2,n/2]))
    delta = Integer.(round.(ratio*centre))
    C[centre[1]-delta[1]+1:centre[1]+delta[1], centre[2]-delta[2]+1:centre[2]+delta[2],:] .= 1
    P = 1 .- C

    # normalisation
    somme_canaux = max.(1,sum(image,dims=3))
    r_P = P.*image[:,:,1]./somme_canaux
    v_P = P.*image[:,:,2]./somme_canaux
    r_C = C.*image[:,:,1]./somme_canaux

    # Calcul de /r_p, /v_p et /r_c
    r_bar_P = sum(r_P[:])/sum(P[:])
    v_bar_P = sum(v_P[:])/sum(P[:])
    r_bar_C = sum(r_C[:])/sum(C[:])

    return [r_bar_P, v_bar_P, r_bar_C]    
end
