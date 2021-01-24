include("day11.jl")
using Test

real_input = collect.(Char,getInput(11,String))

test_input1=[
"L.LL.LL.LL"
"LLLLLLL.LL"
"L.L.L..L.."
"LLLL.LL.LL"
"L.LL.LL.LL"
"L.LLLLL.LL"
"..L.L....."
"LLLLLLLLLL"
"L.LLLLLL.L"
"L.LLLLL.LL"
]

test_input1 = collect.(Char,test_input1)

test_empty=[
"LLL"
"LLL"
"LLL"
]

test_empty = collect.(Char,test_empty)

test_empty_end_state=[
"#L#"
"LLL"
"#L#"
]

test_empty_end_state = collect.(Char,test_empty_end_state)

test_floor=[
"..."
"..."
"..."
]

test_floor = collect.(Char,test_floor)

test_occupied=[
"###"
"###"
"###"
]

test_occupied = collect.(Char,test_occupied)

@testset "Test1: empty 3x3 next state" begin
    @test getNextState(test_empty) == test_occupied
end

@testset "Test1: floor 3x3 next state" begin
    @test getNextState(test_floor) == test_floor
end

@testset "Test1: occupied 3x3 next state" begin
    @test getNextState(test_occupied) == test_empty_end_state
end

@testset "Test1: empty 3x3 end state" begin
    @test getEndState(test_empty) == test_empty_end_state
end

@testset "Test1: getCount empty" begin
    @test getCount(test_empty) == 0
end

@testset "Test1: getCount floor" begin
    @test getCount(test_floor) == 0
end

@testset "Test1: getCount occupied" begin
    @test getCount(test_occupied) == 9
end

@testset "Test1: getCount occupied" begin
    @test getCount(test_empty_end_state) == 4
end

@testset "Test1: test input count" begin
    test_input_end_state = getEndState(test_input1)
    @test getCount(test_input_end_state) == 37
end

@testset "Test2: empty 3x3 next state" begin
    @test getNextState2(test_empty) == test_occupied
end

@testset "Test2: floor 3x3 next state" begin
    @test getNextState2(test_floor) == test_floor
end

@testset "Test2: occupied 3x3 next state" begin
    @test getNextState2(test_occupied) == test_empty_end_state
end

@testset "Test2: empty 3x3 end state" begin
    @test getEndState2(test_empty) == test_empty_end_state
end

@testset "Test2: test input count" begin
    test_input_end_state2 = getEndState2(test_input1)
    @test getCount(test_input_end_state2) == 26
end

@testset "Part1: get EndState and final occupied seats" begin
    real_input_end_state = getEndState(real_input)
    @test getCount(real_input_end_state) == 2418
end

@testset "Part2: get EndState and final occupied seats" begin
    real_input_end_state2 = getEndState2(real_input)
    @test getCount(real_input_end_state2) == 2144
end
