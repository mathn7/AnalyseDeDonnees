using Test, LinearAlgebra, Markdown

include("../src/TP2/MCO.jl")
include("../src/TP2/exercice_2.jl")

include("solutions_tp2/sols_exactes.jl")

@testset "Tests TP2" begin

    tol_erreur = 1e-6


    @testset "MCO" begin
      x_sol = MCO(x_MCO,y_MCO)
      @test x_sol ≈ sol_exacte_MCO  atol = tol_erreur
    end

    @testset "Test exo2" begin
        exercice_2(false)
        result = matread("src/TP2/Resultats-exo2.mat")
                                    

        A = result["A"] 
        b = result["b"] 
        sol_prb_moindre_carre_ordinaires = result["sol_prb_moindre_carre_ordinaires"] 
        sol_prb_moindre_carre_totaux = result["sol_prb_moindre_carre_totaux"] 
        Img_Recons_par_MCO = result["Img_Recons_par_MCO"]
        Img_Recons_par_MCT = result["Img_Recons_par_MCT"]

        @test isapprox(A, A_exact, atol=tol_erreur)
        @test isapprox(b, b_exact, atol=tol_erreur)
        @test isapprox(sol_prb_moindre_carre_ordinaires, sol_exact_prb_moindre_carre_ordinaires, atol=tol_erreur)
        @test isapprox(sol_prb_moindre_carre_totaux, sol_exact_prb_moindre_carre_totaux, atol=tol_erreur)
        @test isapprox(Img_Recons_par_MCO, Img_Recons_par_MCO_exact, atol=tol_erreur)
        @test isapprox(Img_Recons_par_MCT, Img_Recons_par_MCT_exact, atol=tol_erreur)
  end


    end
