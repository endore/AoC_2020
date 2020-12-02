include("day1.jl")
using Test

real_input = getInput(1)

test_input = [
1721
979
366
299
675
1456]

@testset "Example 1" begin
    @test get2020Mult(test_input) == 514579
end

@testset "Part 1" begin
    @test get2020Mult(real_input) == 1019371
end

@testset "Example 2" begin
    @test get2020Mult3(test_input) == 241861950
end

@testset "Part 2" begin
    @test get2020Mult3(real_input) == 278064990
end
