include("day1.jl")
using Test

@testset "Example 1" begin
    input = [
    1721
    979
    366
    299
    675
    1456]

    @test get2020Mult(input) == 514579
end

@testset "Part One" begin
    input = getInput(1)

    @test get2020Mult(input) == 1019371
end
