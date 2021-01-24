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


function getEndState2(input)
    prevState = deepcopy(input)
    endState = getNextState2(prevState)
    while endState != prevState
        prevState = deepcopy(endState)
        endState = getNextState2(prevState)
    end
    return endState
end


function getNextState2(input)
    output = deepcopy(input)
    maxRow = length(input)
    maxCol = length(input[1])
    for r in 1:maxRow,  c in 1:maxCol
        prior_cell_value = input[r][c]
        if prior_cell_value == 'L'
            output[r][c] = UpdateEmptySeat2(input,r,c,maxRow,maxCol)
        elseif prior_cell_value == '#'
            output[r][c] = UpdateOccupiedSeat2(input,r,c,maxRow,maxCol)
        end
    end
    return output
end

function UpdateEmptySeat2(input,r,c,maxRow,maxCol)
    output = '#'

    pos = (r,c)

    directions = [(-1,0),
                  (1,0),
                  (0,1),
                  (0,-1),
                  (1,1),
                  (-1,-1),
                  (1,-1),
                  (-1,1)]

    for dir in directions
        first_seat_status = ScanFirstSeat(input,pos,dir,maxRow,maxCol)
        if first_seat_status == '#'
            output = 'L'
            break
        end
    end

    return output
end

function UpdateOccupiedSeat2(input,r,c,maxRow,maxCol)
    output = '#'

    pos = (r,c)

    occp_count = 0

    directions = [(-1,0),
                  (1,0),
                  (0,1),
                  (0,-1),
                  (1,1),
                  (-1,-1),
                  (1,-1),
                  (-1,1)]

    for dir in directions
        first_seat_status = ScanFirstSeat(input,pos,dir,maxRow,maxCol)
        if first_seat_status == '#'
            occp_count += 1
        end
    end

    if occp_count >= 5
        output = 'L'
    end
    return output
end

function ScanFirstSeat(input,pos,dir,maxRow,maxCol)
    output  = '.'

    r = pos[1]
    c = pos[2]

    deltar = dir[1]
    deltac = dir[2]

    newr = r + deltar
    newc = c + deltac

    while  (1 <= newr <= maxRow) & (1 <= newc <= maxCol)
        newval = input[newr][newc]
        if newval != '.'
            output = newval
            break
        end

        newr += deltar
        newc += deltac
    end

    return output
end
