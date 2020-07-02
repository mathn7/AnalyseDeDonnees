
@testset "Tests TP3" begin
    
    # donnees
    cheminTP3 = "../src/TP3/"
    fleurs = ["pensees","oeillets","chrysanthemes"]
    donnees   = matread(cheminTP3*"mat/donnees.mat")
    tol_erreur = 1e-5
    include(cheminTP3*"moyenne_image.jl")
    include(cheminTP3*"estimation_mu_et_sigma.jl")
    include(cheminTP3*"vraisemblance.jl")
    include(cheminTP3*"couleur_moyenne.jl")

    include(cheminTP3*"exercice_1.jl")
    include(cheminTP3*"exercice_2.jl")
    include(cheminTP3*"exercice_3.jl")
    include(cheminTP3*"exercice_4.jl")

    # tester l'exercice 1
    @testset "Tests exo 1" begin
        exercice1(false,cheminTP3)
        solutions = matread(cheminTP3*"mat/solutions-ex1.mat")

        @testset "moyenne_image" for fleur in fleurs
            @testset "X_$fleur" for i = 1:Integer(donnees["nb_images_$fleur"])
                im = donnees[fleur[1:2] * string(i)]
                @test solutions["X_$fleur"][i,:] ≈ moyenne_image(im) atol = tol_erreur
            end
        end

    end

    # tester l'exercice 2
    @testset "Tests exo 2" begin 
        exercice2(false,cheminTP3)
        solutions = matread(cheminTP3*"mat/solutions-ex2.mat")

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
        exercice3(false,cheminTP3)
        solutions = matread(cheminTP3*"mat/solutions-ex3.mat")
        solutions_ex2 = matread(cheminTP3*"mat/solutions-ex2.mat")
        resultats = matread(cheminTP3*"mat/resultats-ex3.mat")
        
        # nous allons tester juste par rapport à la première classe
        X = solutions_ex2["X_pensees"]
        
        fleur = fleurs[2]
        mu = solutions_ex2["mu_"*fleur]
        Sigma = solutions_ex2["Sigma_"*fleur]
        denominateur = solutions_ex2["denominateur_classe_"*fleur]

        for i in 1:Integer(donnees["nb_images_"*fleur])            
            V_classe,_ = vraisemblance(X[i,1],X[i,2],mu,Sigma,denominateur)
            @test solutions["V_classe_"*fleur][i] ≈ V_classe atol = tol_erreur
        end 
        @test solutions["accuracy"]         ≈ resultats["accuracy"]  atol = tol_erreur
    end

    # tester l'exercice 4
    @testset "Tests exo 4" begin
        exercice4(false,cheminTP3)
        solutions = matread(cheminTP3*"mat/solutions-ex4.mat")        
               
        @testset "couleur moyenne: $fleur" for fleur in fleurs  
            for i = 1:Integer(donnees["nb_images_$fleur"])
                im = donnees[fleur[1:2] * string(i)]
                @test solutions["X_$fleur"][i,:] ≈ couleur_moyenne(im) atol = tol_erreur
            end
        end
    end
    rm(cheminTP3*"mat/resultats-ex1.mat")
    rm(cheminTP3*"mat/resultats-ex2.mat")
    rm(cheminTP3*"mat/resultats-ex3.mat")
    rm(cheminTP3*"mat/resultats-ex4.mat")

end