module AnalyseDeDonnees

using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings
using Markdown
using Printf
using Images

#============= TP1 ==============#
include("TP1/exercice_1.jl")
export tp1_Matrice_de_donnees
export tp1_Individu_moyen
export tp1_Donnees_centrees
export tp1_Matrice_var_cov
include("TP1/exercice_2.jl")
export tp1_Composantes_principales
export tp1_Sigma2

#============= TP2 ==============#
include("TP2/MCO.jl")
export tp2_MCO

#============= TP3 ==============#
include("TP3/couleur_moyenne.jl");     export tp3_couleur_moyenne
include("TP3/vraisemblance.jl");       export tp3_vraisemblance
include("TP3/moyenne_amelioree.jl");   export tp3_moyenne_amelioree
include("TP3/estimation_mu_sigma.jl"); export tp3_estimation_mu_sigma
include("TP3/exercice_1.jl");          export tp3_exercice1
include("TP3/exercice_2.jl");          export tp3_exercice2
include("TP3/exercice_3.jl");          export tp3_exercice3
include("TP3/exercice_3_bis.jl");      export tp3_exercice3bis
include("TP3/exercice_4.jl");          export tp3_exercice4

#============= TP4 ==============#
include("TP4/kppv.jl")
export tp4_kppv

end
