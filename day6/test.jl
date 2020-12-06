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


test_input_group2 = Array{String,1}[]
push!(test_input_group2,["abc"])
push!(test_input_group2,["a";"b";"c"])
push!(test_input_group2,["ab"; "ac"])
push!(test_input_group2,["a";"a";"a";"a"])
push!(test_input_group2,["b"])


@testset "Test1: getGroups" begin
    @test getGroups(test_input) == test_input_group
end

@testset "Sample 1" begin
    @test sum(length.(unique.(test_input_group))) == 11
end

@testset "Part 1: answer" begin
    groups = getGroups(real_input)
    @test sum(length.(unique.(groups))) == 6878
end

@testset "Part 2: test getGroups for part 2" begin
    @test getGroups2(test_input) == test_input_group2
end

@testset "Part 2: test answer" begin
    @test sum(getInteresectCount.(test_input_group2)) == 6
end

@testset "Part 2: answer" begin
    groups = getGroups2(real_input)
    @test sum(getInteresectCount.(groups)) == 3464
end
