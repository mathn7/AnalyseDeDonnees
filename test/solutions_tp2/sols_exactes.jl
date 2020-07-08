using MAT
# exo2
result = MAT.matread("test/solutions_tp2/Resultats-exacts-exo2.mat")

A_exact = result["A"] 
b_exact = result["b"] 
sol_exact_prb_moindre_carre_ordinaires = result["sol_prb_moindre_carre_ordinaires"] 
sol_exact_prb_moindre_carre_totaux = result["sol_prb_moindre_carre_totaux"] 
Img_Recons_par_MCO_exact = result["Img_Recons_par_MCO"] 
Img_Recons_par_MCT_exact = result["Img_Recons_par_MCT"] 

# exo1
x_MCO = [2 4 8]
y_MCO = [1 -2 5]
sol_exacte_MCO = [-0.2861223786053809, -0.1453909680870312, 0.889572518758382, 0.04887470710627255, 0.26230270269780936, 0.18564681492684948]