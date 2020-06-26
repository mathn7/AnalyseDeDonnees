using Test, LinearAlgebra, MAT, LaTeXStrings


include("../src/TP2/exercice_1.jl")
vars = matread("/home/viet/Stage2A/Projet-CSAD/src/TP2/score-exo1.mat")

Score = vars["score"]

score_exacte = 0.9939831528279182
tol_erreur = 1e-4

@testset "exercice 1" begin
     @test Score ≈ score_exacte  atol = tol_erreur
end




