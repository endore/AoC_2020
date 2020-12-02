# https://adventofcode.com/2020/day/1

include("..\\utils\\utils.jl")

function get2020Mult(input)
    #TODO:clean up to only hold set of unique numbers

    mult = nothing
    max_index = length(input)
    for i in 1:max_index
        # search for additive complement in list
        num = input[i]
        remainder = 2020 - num
        remainder_index = findfirst(x-> x == remainder,input)
        if (typeof(remainder_index) != Nothing) && (remainder_index != i)
            mult = num * remainder
            break
        end
    end
    return mult
end

function get2020Mult3(input)
    #TODO:clean up to only hold set of unique numbers

    mult = nothing

    max_index = length(input)
    for i in 1:max_index
        for j in i:max_index
            # get sum of ith and jth items in getInput
            i_num = input[i]
            j_num = input[j]
            combo = i_num + j_num
            remainder = 2020 - combo
            if remainder < 0
                continue
            else
                remainder_index = findfirst(x-> x == remainder,input)
                if (typeof(remainder_index) != Nothing) && (remainder_index != i) && (remainder_index != j)
                    mult = i_num*j_num*remainder
                    break
                end
            end
        end
    end
    return mult
end
