
tol_erreur = 1e-5

@testset "Test TP3" begin

    # tester l'exercice 1
    @testset "Tests exo 1" begin
        solutions = matread("../src/TP3/resultats-ex1-test.mat")
        resultats = matread("../src/TP3/resultats-ex1.mat")
        @test solutions["nb_r"]                     ≈ resultats["nb_r"]  atol = tol_erreur
        @test solutions["nb_v"]                     ≈ resultats["nb_v"]  atol = tol_erreur
        @test solutions["r"][:]                     ≈ resultats["r"][:]  atol = tol_erreur
        @test solutions["v"][:]                     ≈ resultats["v"][:]  atol = tol_erreur
        @test solutions["X_pensees"]                ≈ resultats["X_pensees"]  atol = tol_erreur
        @test solutions["X_oeillets"]               ≈ resultats["X_oeillets"]  atol = tol_erreur
        @test solutions["X_chrysanthemes"]          ≈ resultats["X_chrysanthemes"]  atol = tol_erreur
        @test solutions["nb_images_pensees"]        ≈ resultats["nb_images_pensees"]  atol = tol_erreur
        @test solutions["nb_images_oeillets"]       ≈ resultats["nb_images_oeillets"]  atol = tol_erreur
        @test solutions["nb_images_chrysanthemes"]  ≈ resultats["nb_images_chrysanthemes"]  atol = tol_erreur
    end

    # tester l'exercice 2
    @testset "Tests exo 2" begin 
        solutions = matread("../src/TP3/resultats-ex2-test.mat")
        resultats = matread("../src/TP3/resultats-ex2.mat")
        @test solutions["nb_r"]                              ≈ resultats["nb_r"]  atol = tol_erreur
        @test solutions["nb_v"]                              ≈ resultats["nb_v"]  atol = tol_erreur
        @test solutions["r"][:]                              ≈ resultats["r"][:]  atol = tol_erreur
        @test solutions["v"][:]                              ≈ resultats["v"][:]  atol = tol_erreur
        @test solutions["X_pensees"]                         ≈ resultats["X_pensees"]  atol = tol_erreur
        @test solutions["X_oeillets"]                        ≈ resultats["X_oeillets"]  atol = tol_erreur
        @test solutions["X_chrysanthemes"]                   ≈ resultats["X_chrysanthemes"]  atol = tol_erreur
        @test solutions["V_pensees"]                         ≈ resultats["V_pensees"]  atol = tol_erreur
        @test solutions["V_oeillets"]                        ≈ resultats["V_oeillets"]  atol = tol_erreur
        @test solutions["V_chrysanthemes"]                   ≈ resultats["V_chrysanthemes"]  atol = tol_erreur
        @test solutions["nb_images_pensees"]                 ≈ resultats["nb_images_pensees"]  atol = tol_erreur
        @test solutions["nb_images_oeillets"]                ≈ resultats["nb_images_oeillets"]  atol = tol_erreur
        @test solutions["nb_images_chrysanthemes"]           ≈ resultats["nb_images_chrysanthemes"]  atol = tol_erreur
        @test solutions["mu_pensees"]                        ≈ resultats["mu_pensees"]  atol = tol_erreur
        @test solutions["mu_oeillets"]                       ≈ resultats["mu_oeillets"]  atol = tol_erreur
        @test solutions["mu_chrysanthemes"]                  ≈ resultats["mu_chrysanthemes"]  atol = tol_erreur
        @test solutions["Sigma_pensees"]                     ≈ resultats["Sigma_pensees"]  atol = tol_erreur
        @test solutions["Sigma_oeillets"]                    ≈ resultats["Sigma_oeillets"]  atol = tol_erreur
        @test solutions["Sigma_chrysanthemes"]               ≈ resultats["Sigma_chrysanthemes"]  atol = tol_erreur
        @test solutions["denominateur_classe_pensees"]       ≈ resultats["denominateur_classe_pensees"]  atol = tol_erreur
        @test solutions["denominateur_classe_oeillets"]      ≈ resultats["denominateur_classe_oeillets"]  atol = tol_erreur
        @test solutions["denominateur_classe_chrysanthemes"] ≈ resultats["denominateur_classe_chrysanthemes"]  atol = tol_erreur
    end

    # tester l'exercice 3
    @testset "Test exo 3" begin 
        solutions = matread("../src/TP3/resultats-ex3-test.mat")
        resultats = matread("../src/TP3/resultats-ex3.mat")
        @test solutions["accuracy"]         ≈ resultats["accuracy"]  atol = tol_erreur
    end

    # tester l'exercice 4
    @testset "Test exo 4" begin
        solutions = matread("../src/TP3/resultats-ex4-test.mat")
        resultats = matread("../src/TP3/resultats-ex4.mat")
        @test solutions["r"]                ≈ resultats["r"]  atol = tol_erreur
        @test solutions["v"]                ≈ resultats["v"]  atol = tol_erreur
        @test solutions["X_pensees"]        ≈ resultats["X_pensees"]  atol = tol_erreur
        @test solutions["X_oeillets"]       ≈ resultats["X_oeillets"]  atol = tol_erreur
        @test solutions["X_chrysanthemes"]  ≈ resultats["X_chrysanthemes"]  atol = tol_erreur
    end

end
