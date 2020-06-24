% calcule la vraisemblance p(x, w_i) et le dénominateur de classe
% x est donnée par ses coordonnées sur la grille(r,v)
% w_i est caractérisée par mu_i et Sigma_i
% le dénominateur de classe peut être
%   - calculé (et retourné comme résultat) si denominateur_classe_i = -1
%   - ou fourni
function [ P, denominateur ] = vraisemblance( r, v, mu_i, Sigma_i, denominateur_classe_i )

nb_r = length(r);
nb_v = length(v);

P = zeros(nb_r,nb_v);

for i = 1:nb_r
    for j = 1:nb_v
        x_centre = [r(i);v(j)] - mu_i;
        P(j,i) = exp(-(x_centre')*(Sigma_i \ x_centre)/2);
    end
end

if(denominateur_classe_i == -1)
    denominateur = 2*pi*sqrt(det(Sigma_i));
else
    denominateur = denominateur_classe_i;
end

P = P / denominateur;

end

