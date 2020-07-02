@doc doc"""
**TP3 - Classification bayesienne**

L’estimation empirique des paramètres d’une loi normale bidimensionnelle à partir d’une matrice de données X.

# Entrée
* **X**     : la matrice des donnees

# Sorties
* **mu**    : l'espérance estimée
* **sigma** : la matrice de variance / covariance estimée ``\frac{1}{n}(X^c)^{T} X^c ``

"""
function  estimation_mu_et_sigma(X)

    n = size(X,1)

    # Calcul du vecteur moyen
    mu = X' * ones(n) / n            
    
    # Centrage des donnees
    X_c = X - ones(n) * mu'

    # Cacul de la matrice de covariance
    sigma = X_c' * X_c / n           
    
    return mu, sigma
end
