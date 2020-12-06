# https://adventofcode.com/2020/day/5

include("..\\utils\\utils.jl")


function getRow(code)
    min = 0
    max = 127
    for letter in code
        range = max - min
        step = Int((range + 1)/2) - 1
        if letter == 'F'
            max = min + step
        else
            min = max - step
        end
    end

    selection = max
    if code[end] == 'B'
        selection = min
    end
    return selection
end

function getCol(code)
    min = 0
    max = 7
    for letter in code
        range = max - min
        step = Int((range + 1)/2) - 1
        if letter == 'L'
            max = min + step
        else
            min = max - step
        end
    end

    selection = max
    if code[end] == 'R'
        selection = min
    end
    return selection
end

function getSeatId(input)
    row = getRow(input[1:7])
    col = getCol(input[(end-2):end])
    return getSeatId(row,col)
end

function getSeatId(row,col)
    return 8row + col
end
