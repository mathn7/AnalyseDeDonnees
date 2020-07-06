using Plots
using MAT
using Markdown
include("../src/TP4/TP4AD.jl")

# Commencer les tests
global ok = false
global limit = 1
global k = 1
while !ok && k < 5
    Nt_test=50
    try
        ok = true
        print("Entrez le nombre de tests à éffectuer (max='10000','0'=quitter): ")
        Nt_test = readline() # lire l'entrée clavier
        Nt_test = Integer(parse(Int,Nt_test))            
    catch ArgumentError
        ok = false
        print("ArgumentError! Nt_test par defaut = 50 ") 
        Nt_test = 50
    end 
    println("Nt_test = ",Nt_test)
    if Nt_test > 0
        tp4_exercice(Nt_test)
    else
        break
    end
end    