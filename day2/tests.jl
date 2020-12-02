include("day2.jl")
using Test

real_input = getInput(2,String)

test_input = [
"1-3 a: abcde"
"1-3 b: cdefg"
"2-9 c: ccccccccc"
]

@testset "Example 1" begin
    @test numValid(test_input) == 2
end

@testset "Part 1" begin
    @test numValid(real_input) == 603
end

@testset "Example 2" begin
    @test numValid2(test_input) == 1
end

@testset "Part 2" begin
    @test numValid2(real_input) == 404
end
