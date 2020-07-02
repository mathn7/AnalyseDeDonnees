"""
--------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP3 - Classification bayesienne
 estimation_mu_et_sigma.m
--------------------------------------------------------------------------
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
