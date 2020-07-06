using Test
using Statistics

include("../src/TP1/exercice_2.jl")
include("solutions_tp1/sols_exactes.jl")

#tester le scripts de l'exercice 2 du Tp1 avec l'image automn.tiff
tolerance = 1e-3

#charger l'image à tester
Im = load("../src/TP1/automn.tiff");

Sigma_2 = Sigma2(Im);
c = sum(Sigma_2)
@testset "Tests EXO2" begin
	@testset "coefficients de corrélation" begin
		@test isapprox(r_C1_C2, Sigma_2[1,2]/sqrt(Sigma_2[1,1]*Sigma_2[2,2]), atol=tolerance)
		@test isapprox(r_C1_C3, Sigma_2[1,3]/sqrt(Sigma_2[1,1]*Sigma_2[3,3]), atol=tolerance)
		@test isapprox(r_C2_C3, Sigma_2[2,3]/sqrt(Sigma_2[2,2]*Sigma_2[3,3]), atol=tolerance)
	end
	@testset "proportions de contraste" begin
		@test isapprox(PcC1, Sigma_2[1,1]/c, atol=tolerance)
		@test isapprox(PcC2, Sigma_2[2,2]/c, atol=tolerance)
		@test isapprox(PcC3, Sigma_2[3,3]/c, atol=tolerance)
	end

end
