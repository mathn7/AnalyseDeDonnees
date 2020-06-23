#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP3 - Classification bayesienne
# estimation_mu_Sigma.m
#--------------------------------------------------------------------------

function  estimation_mu_Sigma(X)

    n = size(X,1)

    # Calcul du vecteur moyen
    mu = X'*ones(n)/n            
    
    # Centrage des donnees
    X_c = X-ones(n)*mu'

    # Cacul de la matrice de covariance
    Sigma = (X_c')*X_c/n           
    
    return mu,Sigma
end
