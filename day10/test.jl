include("day10.jl")
using Test

real_input = vec(getInput(10,Int))

test_input1=[
16
10
15
5
1
11
7
19
6
12
4
]

test_dstn1 = [
7
0
5
]

test_input2 = [
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
]

test_dstn2 = [
22
0
10
]

@testset "Test1: getDifferencesDistn test1" begin
    @test getDifferencesDistn(test_input1) == test_dstn1
end

@testset "Test1: getDifferencesDistn test2" begin
    @test getDifferencesDistn(test_input2) == test_dstn2
end

@testset "Part 1: answer" begin
    real_distn = getDifferencesDistn(real_input)
    @test real_distn[1]*real_distn[3] == 1984
end
