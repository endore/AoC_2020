include("day9.jl")
using Test

real_input = getInput(9,Int)

test_input =[
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
]

test_contg = [
15
25
47
40
]

@testset "Test1: isValueIValid true" begin
    @test isValueIValid(test_input,6,5) == true
end

@testset "Test1: isValueIValid false" begin
    @test isValueIValid(test_input,15,5) == false
end

@testset "Test1: example1" begin
    @test getFirstNotSum(test_input,5) == 127
end

@testset "Test2: getContiguousList" begin
    @test getContiguousList(test_input,127) == test_contg
end

@testset "Part 1: answer" begin
    @test getFirstNotSum(real_input,25) == 25918798
end

@testset "Part2: answer" begin
    real_contg_list = getContiguousList(real_input,25918798)
    @test minimum(real_contg_list) + maximum(real_contg_list) == 3340942
end
