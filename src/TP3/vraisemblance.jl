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
function tp3_vraisemblance(x, mu_i, Sigma_i, denominateur_classe_i)

    n = size(x)[1]
    if n > 3
        P = zeros(n,n)
        for i = 1:n
            for j = 1:n
                x_centre = [x[i,1],x[j,2]] - mu_i
                P[j,i] = exp(-x_centre' * (Sigma_i \ x_centre) / 2)
            end
        end
    else
        x_centre = x - mu_i
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

