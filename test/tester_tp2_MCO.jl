using Test, LinearAlgebra

include("../src/TP2/MCO.jl")


  x = [2 4 8]
  y = [1 -2 5]
  tol_erreur = 1e-6

  x_sol = MCO(x,y)
  sol_exacte = [-0.4741441911552731; -0.2409328599213983; 1.4741441911552728; 0.08099212155933987; 0.43467170731173266; 0.3076423428782034]

@testset "MCO" begin
  @test x_sol ≈ sol_exacte  atol = tol_erreur
end



