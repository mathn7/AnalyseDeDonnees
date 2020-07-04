using Test
using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings
using Markdown

@testset "Test CSAD" begin

    # tests du TP1
   @time @testset "Tests TP1" begin
        include("test_tp1_exo1.jl")
        include("test_tp1_exo2.jl")
    end

    # tester le TP3 
    @time include("test_tp3.jl")

end
