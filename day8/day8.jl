# https://adventofcode.com/2020/day/8
# https://juliagraphs.org/LightGraphs.jl/latest/

include("..\\utils\\utils.jl")

function getAccAndLastIndex(instructions)
    # get number of instructions
    num_unique_instructions = length(instructions)

    # initialize vector of ran calls per instruction
    num_instruction_calls = zeros(Int,num_unique_instructions)

    # initialize accumulator to 0
    accumulator = 0

    # initialize instruction index
    index = 1

    while (1 <= index <= num_unique_instructions) && (num_instruction_calls[index] == 0)
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

    return accumulator, index
end

function getOneFixAcc(instructions)
    num_unique_instructions = length(instructions)

    # initialize acc
    acc = 0

    # loop through each instruction to fix
    for i in 1:num_unique_instructions
        #check if instruction i is a fix candidate and apply fix

        # parse instruction
        parse_list = split(instructions[i]," ")
        operation = parse_list[1]

        if operation != "acc"
            # check needed - make copy instructions
            instructions_copy = deepcopy(instructions)
            if operation == "jmp"
                # switch to nop
                instructions_copy[i] = replace(instructions_copy[i], "jmp" => "nop")
            else
                # switch to jmp
                instructions_copy[i] = replace(instructions_copy[i], "nop" => "jmp")
            end

            # get acc and last index once it stops
            acc, index = getAccAndLastIndex(instructions_copy)

            #break if you found succesful fix
            if index == (num_unique_instructions + 1)
                break
            end
        end
    end

    return acc
end
