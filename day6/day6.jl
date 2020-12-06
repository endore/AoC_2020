# https://adventofcode.com/2020/day/6

include("..\\utils\\utils.jl")

function getGroups(input)
    # remove last newline character form input
    input = input[1:(end-1)]

    # parse text data into discrete array of candidates
    groups = split(input,"\n\n")

    # remove \n within each group
    groups = replace.(groups,"\n" => "")

    return groups
end
