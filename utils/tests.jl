include("utils.jl")

using Test

@testset "day 1 10 rows" begin
    input_bm = [
    1593
    1575
    1583
    1609
    1835
    2008
    1638
    1396
    1833
    1524
    ]
    @test getInput(1,Int)[1:10] == input_bm
end

@testset "day 2 10 rows" begin
    input_bm = [
    "13-14 f: ffffffffnfffvv"
    "10-12 w: kwtzpnzspwwwdz"
    "2-3 n: nnjn"
    "2-3 h: hhhh"
    "2-11 c: crccccccccsccc"
    "1-6 b: lcpcbcr"
    "16-20 q: qsqqqqqqqjqqqvqqqqqh"
    "4-5 m: mmfmm"
    "10-13 h: hhhhhhchhkhhphh"
    "10-14 x: xxvxxxxxxvxxxwx"
    ]
    @test getInput(2,String)[1:10] == input_bm
end
