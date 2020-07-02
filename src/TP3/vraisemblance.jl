@doc doc"""
**TP3 - Classification bayesienne**

calcule la vraisemblance p(x, w_i) et le dénominateur de classe x

# Entrées 
* **r,v**                     : les coordonnées sur la grille(r,v) 
* **mu_i**                    : l'esperence estimée
* **Sigma_i**                 : la matrice variance/covariance
* **denominateur\_classe\_i** :le dénominateur de classe i
   - -1
   - ou fourni

# Sorties 
* **P**            : La vraisemblance 
* **denominateur** : le denominateur de la classe i
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

