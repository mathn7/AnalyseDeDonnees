@doc doc"""
**TP3 - Classification bayesienne**

calcule la vraisemblance ``p(x|\omega_i)`` et le dénominateur de classe x

# Entrées 
* **r,v**                     : les coordonnées sur la grille(r,v) 
* **mu_i**                    : l'espérance ``\mu_{i}``
* **Sigma_i**                 : la matrice variance/covariance ``\Sigma_{i}``
* **denominateur\_classe\_i** : le dénominateur de la i-ème classe
   - -1
   - ou fourni ``= (2 \pi)^{d / 2}\left(\operatorname{det} \Sigma_{i}\right)^{1 / 2}``

# Sorties 
* **P**            : La vraisemblance ``p(x|\omega_i)``
* **denominateur** : le denominateur de la i-ème classe ``= (2 \pi)^{d / 2}\left(\operatorname{det} \Sigma_{i}\right)^{1 / 2}``
"""
function vraisemblance( r, v, mu_i, Sigma_i, denominateur_classe_i)

    nb_r = length(r)
    nb_v = length(v)
    if nb_r > 1 || nb_v > 1
        P = zeros(nb_r,nb_v)
        for i = 1:nb_r
            for j = 1:nb_v
                x_centre = [r[i],v[j]] - mu_i
                P[j,i] = exp(-x_centre' * (Sigma_i \ x_centre) / 2)
            end
        end
    else
        x_centre = [r;v] - mu_i
        P = exp(-x_centre' * (Sigma_i \ x_centre) / 2)
    end
    if denominateur_classe_i == -1
        denominateur = 2*pi*sqrt(det(Sigma_i))
    else
        denominateur = denominateur_classe_i
    end

    P = P / denominateur
    
    return P, denominateur
end

