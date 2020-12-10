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
    @test getAccBeforeRepeat(test_input) == 5
end

@testset "Part 1: answer" begin
    @test getAccBeforeRepeat(real_input) == 1915
end
