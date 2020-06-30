using Test, LinearAlgebra

include("../src/TP2/MCO.jl")


  x = [2 4 8]
  y = [1 -2 5]
  tol_erreur = 1e-6

  x_sol = MCO(x,y)
  sol_exacte = [-0.2861223786053809;-0.1453909680870312 ; 0.889572518758382; 0.04887470710627255; 0.26230270269780936; 0.18564681492684948]

@testset "MCO" begin
  @test x_sol ≈ sol_exacte  atol = tol_erreur
end
