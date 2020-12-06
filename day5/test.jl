include("day5.jl")
using Test

real_input = getInput(5,String)

test_input1 = "BFFFBBFRRR"
test_input2 = "BBFFBBFRLL"

test_row1 = "BFFFBBF"
test_row2 = "FFFBBBF"
test_row3 = "BBFFBBF"

test_col1 = "RRR"
test_col2 = "RLL"

@testset "Test 1: get row" begin
    @test getRow(test_row1) == 70
    @test getRow(test_row2) == 14
    @test getRow(test_row3) == 102
end

@testset "Test 1: get col" begin
    @test getCol(test_col1) == 7
    @test getCol(test_col2) == 4
end

@testset "Test 1: get col" begin
    @test getCol(test_col1) == 7
    @test getCol(test_col2) == 4
end

@testset "Test 1: get seat id by row and col" begin
    @test getSeatId(70,7) == 567
    @test getSeatId(102,4) == 820
end

@testset "Test 1: get seat id by input" begin
    @test getSeatId(test_input1) == 567
    @test getSeatId(test_input2) == 820
end

@testset "Part 1" begin
    @test maximum(getSeatId.(real_input)) == 832
end

@testset "Part 2" begin
    seatIDs = getSeatId.(real_input)
    @test getMySeat(seatIDs) == 517
end
