"""
--------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP3 - Classification bayesienne
 tapez_entrer.jl
--------------------------------------------------------------------------
"""
function tapez_entrer()
    prompt = "Tapez la clé entrer pour continuer "
    return (print(stdout, prompt); read(stdin, 1); nothing)

end