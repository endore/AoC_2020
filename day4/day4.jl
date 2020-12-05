# https://adventofcode.com/2020/day/4

include("..\\utils\\utils.jl")

function numValidPassposrts(input)
    # remove last newline character form input
    input = input[1:(end-1)]

    # parse text data into discrete array of candidates
    candidates = split(input,"\n\n")

    # initiate valid count to 0
    num_valid = 0

    # set list of required_keys - missing cid
    required_keys = ["byr" "iyr" "eyr" "hgt" "hcl" "ecl" "pid"]

    #loop through each password candidate
    for candidate in candidates
        # search for each required key - if all exsists then update count
        is_valid = 1

        # validate each required key exists
        for key in required_keys
            if length(findall(key*":",candidate)) != 1
                is_valid = 0
                break
            end
        end

        num_valid += is_valid
    end

    return num_valid
end


function numValidPassposrts2(input)
    # remove last newline character form input
    input = input[1:(end-1)]

    # parse text data into discrete array of candidates
    candidates = split(input,"\n\n")

    # initiate valid count to 0
    num_valid = 0

    # set list of required_keys - missing cid
    required_keys = ["byr" "iyr" "eyr" "hgt" "hcl" "ecl" "pid"]

    # dict of keys to validator functions
    validator_dict = Dict(
        "byr" => validateByr,
        "iyr" => validateIyr,
        "eyr" => validateEyr,
        "hgt" => validateHgt,
        "hcl" => validateHcl,
        "ecl" => validateEcl,
        "pid" => validatePid
    )

    #loop through each password candidate
    for candidate in candidates
        # search for each required key - if all exsists then update count
        is_valid = 1

        # clean up candidate String
        clean_candidate = replace(candidate,"\n" => " ")

        # create candidate dictionary
        candidate_dict = getCandidateDict(clean_candidate)

        # check that all required_keys are present
        if minimum([haskey(candidate_dict, key) for key in required_keys])
            # validate each required keys value
            for key in required_keys
                value = candidate_dict[key]

                if validator_dict[key](value) == 0
                    is_valid = 0
                    break
                end
            end
        else
            is_valid = 0
        end

        num_valid += is_valid
    end

    return num_valid
end

function getCandidateDict(clean_candidate)
    candidate_dict = Dict{String,String}()
    for item in split(clean_candidate," ")
        split_key_value = split(item,":")
        key = split_key_value[1]
        value = split_key_value[2]
        candidate_dict[key] = value
    end
    return candidate_dict
end

function validateByr(value)
    # four digits; at least 1920 and at most 2002.
    valid = 0
    if occursin(r"^[0-9]{4}$",value)
        num_value = parse(Int,value)
        if 1920 <= num_value <= 2002
            valid = 1
        end
    end

    return valid
end

function validateType1(value, min, max)
    # four digits; at least min and at most max.
    valid = 0
    if occursin(r"^[0-9]{4}$",value)
        num_value = parse(Int,value)
        if min <= num_value <= max
            valid = 1
        end
    end

    return valid
end

function validateByr(value)
    validateType1(value,1920,2002)
end

function validateIyr(value)
    validateType1(value,2010,2020)
end

function validateEyr(value)
    validateType1(value,2020,2030)
end

function validateHgt(value)
    valid = 0
    if occursin(r"^[0-9]{3}cm$", value)
        num_value = parse(Int,value[1:3])
        if 150 <= num_value <= 193
            valid = 1
        end
    elseif occursin(r"^[0-9]{2}in$", value)
        num_value = parse(Int,value[1:2])
        if 59 <= num_value <= 76
            valid = 1
        end
    end

    return valid
end

function validateHcl(value)
    valid = 0
    if occursin(r"^#[0-9|a-f]{6}$",value)
        valid = 1
    end

    return valid
end

function validateEcl(value)
    valid = 0
    if occursin(r"^(amb|blu|brn|gry|grn|hzl|oth)$",value)
        valid = 1
    end

    return valid
end

function validatePid(value)
    valid = 0
    if occursin(r"^[0-9]{9}$",value)
        valid = 1
    end

    return valid
end
