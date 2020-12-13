# https://adventofcode.com/2020/day/9

include("..\\utils\\utils.jl")

function getFirstNotSum(input, preamble_length)
    start_index = preamble_length + 1

    first_error = input[start_index]

    for i in start_index:length(input)
        is_valid = isValueIValid(input,i,preamble_length)
        if !is_valid
            first_error = input[i]
            break
        end
    end
    return first_error
end

function isValueIValid(input,i,preamble_length)
    valid = false
    i_value = input[i]
    input_slice = input[(i-preamble_length):(i-1)]
    for k in 1:preamble_length, j in (k+1):preamble_length
        sum_value = input_slice[k] + input_slice[j]
        if sum_value == i_value
            valid = true
            break
        end
    end
    return valid
end
