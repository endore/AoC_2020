include("day3.jl")
using Test


real_input = getInput(3,String)
test_input = [
"..##......."
"#...#...#.."
".#....#..#."
"..#.#...#.#"
".#...##..#."
"..#.##....."
".#.#.#....#"
".#........#"
"#.##...#..."
"#...##....#"
".#..#...#.#"
]

@testset "Example 1" begin
    @test numTrees(test_input) == 7
end

@testset "Example 1" begin
    @test numTrees(test_input, 3, 1) == 7
end

@testset "Part 1" begin
    @test numTrees(real_input) == 216
end

@testset "Part 1" begin
    @test numTrees(real_input, 3, 1) == 216
end

@testset "Example 2" begin
    @test numTrees(test_input,1,1) == 2
    @test numTrees(test_input,3,1) == 7
    @test numTrees(test_input,5,1) == 3
    @test numTrees(test_input,7,1) == 4
    @test numTrees(test_input,1,2) == 2
end

@testset "Part 2" begin
    @test numTrees(real_input,1,1) == 79
    @test numTrees(real_input,3,1) == 216
    @test numTrees(real_input,5,1) == 91
    @test numTrees(real_input,7,1) == 96
    @test numTrees(real_input,1,2) == 45
    @test 79*216*91*96*45 == 6708199680
end
