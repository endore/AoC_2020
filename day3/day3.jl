# https://adventofcode.com/2020/day/3

include("..\\utils\\utils.jl")

function numTrees(input)
    # get num rows, cols
    n_rows = length(input)
    n_cols = length(input[1])

    # expand pattern so that n_cols >= down_steps * right_size

    start_row = 1
    start_col = 1

    down_size = 1
    right_size = 3

    down_steps = Int((n_rows-1)/down_size)
    n_repeats = Int(ceil((1+right_size*down_steps)/n_cols))
    expanded_input = [repeat(row,n_repeats) for row in input]

    #traverse map and count trees
    n_trees = 0


    current_row = start_row
    current_col = start_col


    for step in 1:down_steps
        current_row = current_row + down_size
        current_col = current_col + right_size

        if expanded_input[current_row][current_col] == '#'
            n_trees += 1
        end
    end

    return n_trees
end

function numTrees(input, right_size, down_size)
    # get num rows, cols
    n_rows = length(input)
    n_cols = length(input[1])

    # expand pattern so that n_cols >= down_steps * right_size
    start_row = 1
    start_col = 1

    down_steps = Int((n_rows-1)/down_size)
    n_repeats = Int(ceil((1+right_size*down_steps)/n_cols))
    expanded_input = [repeat(row,n_repeats) for row in input]

    #traverse map and count trees
    n_trees = 0


    current_row = start_row
    current_col = start_col


    for step in 1:down_steps
        current_row = current_row + down_size
        current_col = current_col + right_size

        if expanded_input[current_row][current_col] == '#'
            n_trees += 1
        end
    end

    return n_trees
end
