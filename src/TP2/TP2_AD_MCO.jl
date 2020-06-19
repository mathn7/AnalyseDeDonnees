function MCO(x,y)

#  Cette fonction evalue la fonction f du probl�me de moindres carr�s :

#  Inputs
#  Outputs:
#  f : valeur d


# Initialisation
n = length(x);

A = [(x.*x)' (x.*y)' (y.*y)' x' y' ones(n,1)];
B = zeros(n,1);
A = [A ; 1 0 1 0 0 0];
B = [B ; 1];
X_chapeau=pinv(A)*B;
return X_chapeau
end
