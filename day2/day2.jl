# https://adventofcode.com/2020/day/2

include("..\\utils\\utils.jl")

function numValid(input)
    numValid = 0
    # regex to group the rows and parse information
    regExpr = r"^([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)$"
    for row in input
        # use regex to parse String for min, max, letter, password
        # test that row matches regExpr
        if occursin(regExpr,row)
            m = match(regExpr,row)

            min_count = parse(Int,m.captures[1])
            max_count = parse(Int,m.captures[2])
            # using first function to store as Char
            letter = first(m.captures[3])
            password = m.captures[4]
        else
            #TODO: raise error
        end


        # count how many times letter shows up in password
        n_count = length(findall(x-> x == letter, password))

        # check if within min-max and updated numValid if yes
        if min_count <= n_count <= max_count
            numValid += 1
        end
    end
    return numValid
end

function numValid2(input)
    numValid = 0
    # regex to group the rows and parse information
    regExpr = r"^([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)$"
    for row in input
        # use regex to parse String for first_index,second_index, letter, password
        # test that row matches regExpr
        if occursin(regExpr,row)
            m = match(regExpr,row)

            first_index = parse(Int,m.captures[1])
            second_index = parse(Int,m.captures[2])
            # using first function to store as Char
            letter = first(m.captures[3])
            password = m.captures[4]
        else
            #TODO: raise error
        end

        count = 0
        if password[first_index] == letter
            count +=1
        end

        if password[second_index] == letter
            count +=1
        end

        # check if count == 1 and update numvalid accordingly
        if count == 1
            numValid += 1
        end
    end
    return numValid
end
