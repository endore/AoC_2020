include("utils.jl")

using Test

@testset "day 1 10 rows" begin
    input_bm = [
    1593
    1575
    1583
    1609
    1835
    2008
    1638
    1396
    1833
    1524
    ]
    @test getInput(1)[1:10] == input_bm
end
