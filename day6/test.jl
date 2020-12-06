include("day6.jl")
using Test

io = open("day6\\input.txt","r")
real_input = read(io,String)
# real_input = getInput(5,String)

test_input = """
abc

a
b
c

ab
ac

a
a
a
a

b
"""

test_input_group = [
"abc"
"abc"
"abac"
"aaaa"
"b"
]

@testset "Test1: getGroups" begin
    @test getGroups(test_input) == test_input_group
end


@testset "Sample 1" begin
    @test sum(length.(unique.(test_input_group))) == 11
end

@testset "Part 1" begin
    groups = getGroups(real_input)
    @test sum(length.(unique.(groups))) == 11
end
