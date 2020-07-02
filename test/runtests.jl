using Test
using MAT

@testset "Test CSAD" begin

    # tests du TP1
    @testset "Tests TP1" begin
        include("test_tp1_exo1.jl")
        include("test_tp1_exo2.jl")
    end

    # tester le TP3 
    include("tp3_test.jl")

end
