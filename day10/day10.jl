# https://adventofcode.com/2020/day/10

# overloading sort to add dims = 1 method to sort for vectors
import Base.sort

include("..\\utils\\utils.jl")

function getDifferencesDistn(input)
    dstn_list = zeros(Int,3)
    sorted_input = sort(input)
    prev_jolt = 0
    for jolt in sorted_input
        jolt_diff = jolt - prev_jolt
        if 1 <= jolt_diff <= 3
            dstn_list[jolt_diff] += 1
            prev_jolt = jolt
        else
            # TODO:error out
        end

    end
    # add one more +3 diff for the built-in adapter
    dstn_list[3] += 1
    return dstn_list
end
