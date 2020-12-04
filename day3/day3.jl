# https://adventofcode.com/2020/day/3

include("..\\utils\\utils.jl")

function numTrees(input)
    # get num rows, cols
    n_rows = length(input)
    n_cols = length(input[1])

    # expand pattern so that n_cols >= 3 * n_rows
    n_repeats = Int(ceil(3*n_rows/n_cols))
    expanded_input = [repeat(row,n_repeats) for row in input]

    #traverse map and count trees
    n_trees = 0

    start_row = 1
    start_col = 1
    down_size = 1
    right_size = 3

    current_row = start_row
    current_col = start_col

    for step  in 1:n_rows-1
        current_row = current_row + down_size
        current_col = current_col + right_size

        if expanded_input[current_row][current_col] == '#'
            n_trees += 1
        end
    end

    return n_trees
end
