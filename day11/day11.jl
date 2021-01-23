# https://adventofcode.com/2020/day/11
include("..\\utils\\utils.jl")

function getEndState(input)
    prevState = deepcopy(input)
    endState = getNextState(prevState)
    while endState != prevState
        prevState = deepcopy(endState)
        endState = getNextState(prevState)
    end
    return endState
end

function getNextState(input)
    output = deepcopy(input)
    maxRow = length(input)
    maxCol = length(input[1])
    for r in 1:maxRow,  c in 1:maxCol
        prior_cell_value = input[r][c]
        if prior_cell_value == 'L'
            output[r][c] = UpdateEmptySeat(input,r,c,maxRow,maxCol)
        elseif prior_cell_value == '#'
            output[r][c] = UpdateOccupiedSeat(input,r,c,maxRow,maxCol)
        end
    end
    return output
end

function UpdateEmptySeat(input,r,c,maxRow,maxCol)
    output = '#'
    steps = [-1 0 1]
    for newr  in  r .+ steps, newc in c .+ steps
        if (1 <= newr <= maxRow) & (1 <= newc <= maxCol)
            if input[newr][newc] == '#'
                output = 'L'
                break
            end
        end
    end
    return output
end

function UpdateOccupiedSeat(input,r,c,maxRow,maxCol)
    output = '#'
    occp_count = 0
    steps = [-1 0 1]
    for newr  in  r .+ steps, newc in c .+ steps
        if (1 <= newr <= maxRow) & (1 <= newc <= maxCol)
            if input[newr][newc] == '#'
                occp_count += 1
            end
        end
    end
    if occp_count >= 5
        output = 'L'
    end
    return output
end

function getCount(input)
    count = sum(sum([row .== '#' for row in input]))
end
