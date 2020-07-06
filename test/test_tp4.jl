
@testset "Tests TP4" begin
    
    include("../src/TP4/kppv.jl")
    # Choix du nombre de voisins
    K = 10
    tol_erreur = 1e-3

    # solutions 
    solutions = MAT.matread("solutions_tp4/solutions_tp4.mat")

    # donnees
    dataset = MAT.matread("../src/TP4/MNIST.mat")
    DataA = dataset["database_train_images"]
    labelA = dataset["database_train_labels"]
    DataT = dataset["database_test_images"]
    labelT = dataset["database_test_labels"]

    # le cas de test 1
    partition, confusion, nb_erreurs = kppv(false, DataA, DataT, labelA, labelT, K, collect(1:K), 10)
    @test partition  ≈ solutions["partition10"]   atol = tol_erreur
    @test confusion  ≈ solutions["confusion10"]   atol = tol_erreur
    @test nb_erreurs ≈ solutions["nb_erreurs10"]  atol = tol_erreur

    # le cas de test 2
    partition, confusion, nb_erreurs = kppv(false, DataA, DataT, labelA, labelT, K, collect(1:K), 50)
    @test partition  ≈ solutions["partition50"]   atol = tol_erreur
    @test confusion  ≈ solutions["confusion50"]   atol = tol_erreur
    @test nb_erreurs ≈ solutions["nb_erreurs50"]  atol = tol_erreur

    # le cas de test 3
    partition, confusion, nb_erreurs = kppv(false, DataA, DataT, labelA, labelT, K, collect(1:K), 100)
    @test partition  ≈ solutions["partition100"]  atol = tol_erreur
    @test confusion  ≈ solutions["confusion100"]  atol = tol_erreur
    @test nb_erreurs ≈ solutions["nb_erreurs100"] atol = tol_erreur
end