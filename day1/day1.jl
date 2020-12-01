# https://adventofcode.com/2020/day/1

include("..\\utils\\utils.jl")

function get2020Mult(input)
    #TODO:clean up to only hold set of unique numbers

    mult = nothing
    
    for num in input
        # search for additive complement in list
        complement = 2020 - num
        complement_index = findfirst(x-> x == complement,input)
        if typeof(complement_index) != Nothing
            mult = num * complement
            break
        end
    end
    return mult
end
