#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# moyenne_ex4.m
#--------------------------------------------------------------------------

function couleur_moyenne(I)

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
    r_barre_P = sum(r_P[:])/sum(P[:])
    v_barre_P = sum(v_P[:])/sum(P[:])
    r_barre_C = sum(r_C[:])/sum(C[:])
    return [r_barre_P, v_barre_P, r_barre_C]
    
end
