using Test
using MAT
using LinearAlgebra
using Statistics
using LaTeXStrings
using Markdown

@testset "Test CSAD" begin

    # tests du TP1
    @testset "Tests TP1" begin
        include("test_tp1_exo1.jl")
        include("test_tp1_exo2.jl")
    end

    # tester le TP3 
    include("test_tp3.jl")  
    
    # tester le TP4
    include("test_tp4.jl")      
end