include("day7.jl")
using Test

real_input = getInput(7,String)

test_input =[
"light red bags contain 1 bright white bag, 2 muted yellow bags."
"dark orange bags contain 3 bright white bags, 4 muted yellow bags."
"bright white bags contain 1 shiny gold bag."
"muted yellow bags contain 2 shiny gold bags, 9 faded blue bags."
"shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags."
"dark olive bags contain 3 faded blue bags, 4 dotted black bags."
"vibrant plum bags contain 5 faded blue bags, 6 dotted black bags."
"faded blue bags contain no other bags."
"dotted black bags contain no other bags."
]

test_list = [
"light red"
"bright white"
"muted yellow"
"dark orange"
"shiny gold"
"faded blue"
"dark olive"
"vibrant plum"
"dotted black"
]

test_graph = SimpleWeightedDiGraph{Int,Int}(9)

add_edge!(test_graph,1,2,1)
add_edge!(test_graph,1,3,2)
add_edge!(test_graph,2,5,1)
add_edge!(test_graph,3,5,2)
add_edge!(test_graph,3,6,9)
add_edge!(test_graph,4,2,3)
add_edge!(test_graph,4,3,4)
add_edge!(test_graph,5,7,1)
add_edge!(test_graph,5,8,2)
add_edge!(test_graph,7,6,3)
add_edge!(test_graph,7,9,4)
add_edge!(test_graph,8,6,5)
add_edge!(test_graph,8,9,6)

@testset "Test1: getContainGraph" begin
    out_graph, out_list = getContainGraph(test_input)
    @test out_list == test_list
    @test out_graph == test_graph
end

@testset "Test1: getCountParentBags" begin
    @test getCountParentBags(test_graph,test_list) == 4
end

@testset "Part 1: answer" begin
    real_bags, real_list = getContainGraph(real_input)
    @test getCountParentBags(real_bags,real_list) == 348
end
