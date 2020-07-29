using Test
using Statistics
using Images

include("../src/TP1/exercice_1.jl")
include("solutions_tp1/sols_exactes.jl")

#tester le scripts de l'exercice 1 du Tp1 avec l'image automn.tiff
tolerance = 1e-3

#charger l'image à tester
Im = load("../src/TP1/automn.tiff")

#matrice de variance covariance
Sigma = tp1_Matrice_var_cov(Im)

c = sum(diag(Sigma))

@testset "Tests EXO1" begin
	@testset "test de l'individu moyen" begin
		@test isapprox(Ind_moyen,tp1_Individu_moyen(Im),atol=tolerance)
	end
	@testset "test de la matrice de variance/covariance" begin
		@testset "coefficients de corrélation" begin
			@test isapprox(r_R_V, Sigma[1,2]/sqrt(Sigma[1,1]*Sigma[2,2]), atol=tolerance)
			@test isapprox(r_R_B, Sigma[1,3]/sqrt(Sigma[1,1]*Sigma[3,3]), atol=tolerance)
			@test isapprox(r_V_B, Sigma[2,3]/sqrt(Sigma[2,2]*Sigma[3,3]), atol=tolerance)
		end
		@testset "proportions de contraste" begin
			@test isapprox(PcR, Sigma[1,1]/c, atol=tolerance)
			@test isapprox(PcV, Sigma[2,2]/c, atol=tolerance)
			@test isapprox(PcB, Sigma[3,3]/c, atol=tolerance)
		end
	end
end
