using Test
using Statistics

include("../src/TP1/exercice_1.jl")

#tester le scripts de l'exercice 1 du Tp1 avec l'image automn.tiff
tolerance = 1e-3

#charger l'image à tester
Im = load("src/TP1/automn.tiff");

#l'individu moyen pour l'image automn
Ind_moyen = [0.469,0.432,0.388]
#matrice de variance covariance
Sigma = Matrice_var_cov(Im);

#tester les coefficients de corrélation linéaire
#et les proportions de contraste pour l'image automn
r_R_V = 0.986
r_R_B = 0.969
r_V_B = 0.992
PcR = 0.336
PcV = 0.346
PcB = 0.318

c = sum(diag(Sigma));

@testset "tester l'individu moyen et la matrice de variance/covariance" begin
	@testset "test de l'individu moyen" begin
		@test isapprox(Ind_moyen,Individu_moyen(Im),atol=tolerance)
	end
	@testset "test de la matrice de variance/covariance" begin
		@testset "coefficients de corrélation" begin
			@test isapprox(r_R_V,Sigma[1,2]/sqrt(Sigma[1,1]*Sigma[2,2]),atol=tolerance)
			@test isapprox(r_R_B,Sigma[1,3]/sqrt(Sigma[1,1]*Sigma[3,3]),atol=tolerance)
			@test isapprox(r_V_B,Sigma[2,3]/sqrt(Sigma[2,2]*Sigma[3,3]),atol=tolerance)
		end
		@testset "proportions de contraste" begin
			@test isapprox(PcR,Sigma[1,1]/c,atol=tolerance)
			@test isapprox(PcV,Sigma[2,2]/c,atol=tolerance)
			@test isapprox(PcB,Sigma[3,3]/c,atol=tolerance)
		end
	end

end
