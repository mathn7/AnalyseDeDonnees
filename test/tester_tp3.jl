
tol_erreur = 1e-5

@testset "Tests TP3" begin
    
    fleurs = ["pensees","oeillets","chrysanthemes"]
    donnees   = matread("../src/TP3/donnees.mat")
    nb_images_pensees = Integer(donnees["nb_images_pensees"])
    nb_images_oeillets = Integer(donnees["nb_images_oeillets"])
    nb_images_chrysanthemes = Integer(donnees["nb_images_chrysanthemes"])

    # tester l'exercice 1
    @testset "Tests exo 1" begin
        solutions = matread("../src/TP3/resultats-ex1-test.mat")
        include("../src/TP3/moyenne_image.jl")

        @testset "moyenne_image" for fleur in fleurs
            @testset "X_$fleur" for i = 1:Integer(donnees["nb_images_$fleur"])
                im = donnees[fleur[1:2] * string(i)]
                @test solutions["X_$fleur"][i,:] ≈ moyenne_image(im) atol = tol_erreur
            end
        end

    end

    # tester l'exercice 2
    @testset "Tests exo 2" begin 
        solutions = matread("../src/TP3/resultats-ex2-test.mat")
        include("../src/TP3/estimation_mu_et_sigma.jl")
        include("../src/TP3/vraisemblance.jl")

        r = solutions["r"][:]
        v = solutions["v"][:]

        @testset "vraisemblance et estimation: $fleur" for fleur in fleurs  
            mu, Sigma        = estimation_mu_et_sigma(solutions["X_"*fleur])
            vr, denominateur = vraisemblance(r, v, solutions["mu_"*fleur], solutions["Sigma_"*fleur], -1)
            @test solutions["mu_"*fleur]                   ≈ mu  atol = tol_erreur
            @test solutions["Sigma_"*fleur]                ≈ Sigma  atol = tol_erreur              
            @test solutions["V_"*fleur]                    ≈ vr atol = tol_erreur
            @test solutions["denominateur_classe_"*fleur]  ≈ denominateur  atol = tol_erreur
        end
    end

    # tester l'exercice 3
    @testset "Tests exo 3" begin 
        solutions = matread("../src/TP3/resultats-ex3-test.mat")
        resultats = matread("../src/TP3/resultats-ex3.mat")
        @test solutions["accuracy"]         ≈ resultats["accuracy"]  atol = tol_erreur
    end

    # tester l'exercice 4
    @testset "Tests exo 4" begin
        solutions = matread("../src/TP3/resultats-ex4-test.mat")
        include("../src/TP3/couleur_moyenne.jl")
               
        @testset "couleur moyenne: $fleur" for fleur in fleurs  
            for i = 1:Integer(donnees["nb_images_$fleur"])
                im = donnees[fleur[1:2] * string(i)]
                @test solutions["X_$fleur"][i,:] ≈ couleur_moyenne(im) atol = tol_erreur
            end
        end
    end

end
