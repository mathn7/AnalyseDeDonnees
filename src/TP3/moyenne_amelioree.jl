@doc doc"""
**TP3 - Classification bayesienne**

Calcule les trois valeurs décrivant l'image ``(\bar{r},\bar{v},\bar{r}_{C})``

# Entrées 
* **I** : l'image

# Sorties 
* **[r\_bar\_P, v\_bar\_P, r\_bar\_C]** : (\bar{r},\bar{v})`` calculées sur le pourtour P et la valeur ``\bar{r}_{C}`` calculée sur le centre C

"""
function moyenne_amelioree(I)

    # Conversion au format flottants
    I = float(I)
    
    # Calcul des masques de centre et pourtour
    (m,n) = size(I)
    C = I*0
    centre = Integer.(round.([m/2,n/2]))
    delta = Integer.(round.(0.1*centre))
    C[centre[1]-delta[1]+1:centre[1]+delta[1], centre[2]-delta[2]+1:centre[2]+delta[2],:] .= 1
    P = 1 .- C

    # Calcul des couleurs normalisees r et v
    somme_canaux = max.(1,sum(I,dims=3))
    r_P = P.*I[:,:,1]./somme_canaux
    v_P = P.*I[:,:,2]./somme_canaux
    r_C = C.*I[:,:,1]./somme_canaux

    # Calcul de la couleur moyenne /r et /v
    r_bar_P = sum(r_P[:])/sum(P[:])
    v_bar_P = sum(v_P[:])/sum(P[:])
    r_bar_C = sum(r_C[:])/sum(C[:])
    return [r_bar_P, v_bar_P, r_bar_C]
    
end
