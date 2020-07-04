using Markdown
@doc doc"""
**TP3 - Classification bayesienne**

L’estimation empirique des paramètres d’une loi normale bidimensionnelle à partir d’une matrice de données X.

# Entrée
* **X**     : la matrice des donnees

# Sorties
* **mu**    : l'espérance estimée ``= E[X]``
* **sigma** : la matrice de variance / covariance estimée ``= E[(X - \mu)(X - \mu)^{T}]``

"""
function tp3_estimation_mu_sigma(X)

    n = size(X,1)

    # Calcul du vecteur moyen
    mu = X' * ones(n) / n            
    
    # Centrage des donnees
    X_c = X - ones(n) * mu'

    # Cacul de la matrice de covariance
    sigma = X_c' * X_c / n           
    
    return mu, sigma
end
