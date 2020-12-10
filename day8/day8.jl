# https://adventofcode.com/2020/day/8
# https://juliagraphs.org/LightGraphs.jl/latest/

include("..\\utils\\utils.jl")

function getAccBeforeRepeat(instructions)
    # get number of instructions
    num_unique_instructions = length(instructions)

    # initialize vector of ran calls per instruction
    num_instruction_calls = zeros(Int,num_unique_instructions)

    # initialize accumulator to 0
    accumulator = 0

    # initialize instruction index
    index = 1

    while num_instruction_calls[index] == 0
        # parse instruction on index
        parse_list = split(instructions[index]," ")
        operation = parse_list[1]
        input = parse(Int,parse_list[2])

        # update num calls to instruction
        num_instruction_calls[index] += 1

        # apply instruction
        if operation == "acc"
            accumulator += input
            index += 1
        elseif operation == "jmp"
            index += input
        else # nop operation
            index +=1
        end
    end

    return accumulator
end
