using DelimitedFiles

function getInput(day::Int,myType)
    input_arr = readdlm("day$day\\input.txt",'\t',myType)
end
