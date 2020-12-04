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

@testset "Part 1" begin
    @test numTrees(real_input) == 216
end

@testset "Example 2" begin
    @test numValid2(test_input) == 1
end

@testset "Part 2" begin
    @test numValid2(real_input) == 404
end
