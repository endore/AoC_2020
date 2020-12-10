include("day8.jl")
using Test

real_input = getInput(8,String)

test_input =[
"nop +0"
"acc +1"
"jmp +4"
"acc +3"
"jmp -3"
"acc -99"
"acc +1"
"jmp -4"
"acc +6"
]

@testset "Test1: getAccBeforeRepeat" begin
    acc, index = getAccAndLastIndex(test_input)
    @test acc == 5
end

@testset "Test2: getOneFixAcc" begin
    @test getOneFixAcc(test_input) == 8
end

@testset "Part 1: answer" begin
    acc, index = getAccAndLastIndex(real_input)
    @test acc == 1915
end

@testset "Part 2: answer" begin
    @test getOneFixAcc(real_input) == 944
end
