using DelimitedFiles

function getInput(day::Int)
    input_arr = readdlm("day$day\\input.txt",'\t',Int)
end
