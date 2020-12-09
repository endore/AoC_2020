# https://adventofcode.com/2020/day/7
# https://juliagraphs.org/LightGraphs.jl/latest/

include("..\\utils\\utils.jl")

using LightGraphs, SimpleWeightedGraphs

function getCountParentBags(bagGraph,bagList; bag_name = "shiny gold")
    bag_index = findall(bagList .== bag_name)[1]
    count = length(neighborhood(bagGraph,bag_index,Inf; dir = :in)) - 1
    return count
end

function getContainGraph(input)

    # initiate empty directed graph with weights
    bagGraph = SimpleWeightedDiGraph{Int,Int}()

    # initiate empty list of bag names
    bagList = Array{String,1}()

    for line in input
        # parse line: get parent_bag, child bags
        parent_bag = getParentBag(line)

        child_bags, child_weights = getChildBagsAndWeights(line)

        # updateBagList
        updateBagList!(bagList,parent_bag,child_bags)

        # update barGraph
        updateBagGraph!(bagGraph,bagList,parent_bag,child_bags,child_weights)
    end

    return bagGraph, bagList
end


function getParentBag(line)
    regPattern = r"^([a-z]+ [a-z]+) bags"

    return match(regPattern, line).captures[1]
end

function getChildBags(line)
    regPattern = r"^([a-z]+ [a-z]+) bags contain (.*).$"

    child_bags = Array{String,1}()

    child_bags_group = match(regPattern, line).captures[2]
    no_child_string = "no other bags"

    child_regPattern = r"^[0-9]+ ([a-z]+ [a-z]+) bag[s]?"

    if child_bags_group != no_child_string
        child_bags_raw = split(child_bags_group,", ")

        child_bags = [match(child_regPattern,raw_child).captures[1] for raw_child in child_bags_raw]
    end
    return child_bags
end

function getChildBagsAndWeights(line)
    regPattern = r"^([a-z]+ [a-z]+) bags contain (.*).$"

    child_bags = Array{String,1}()
    child_weights = Array{Int,1}()

    child_bags_group = match(regPattern, line).captures[2]
    no_child_string = "no other bags"

    child_regPattern = r"^([0-9]+) ([a-z]+ [a-z]+) bag[s]?"

    if child_bags_group != no_child_string
        child_bags_raw = split(child_bags_group,", ")

        child_bags = [match(child_regPattern,raw_child).captures[2] for raw_child in child_bags_raw]
        child_weights = [match(child_regPattern,raw_child).captures[1] for raw_child in child_bags_raw]
        child_weights = parse.(Int,child_weights)
    end
    return child_bags, child_weights
end


function updateBagList!(bagList,parent_bag,child_bags)
    check_bags = deepcopy(child_bags)
    pushfirst!(check_bags,parent_bag)

    for bag in check_bags
        count = length(findall(bagList .== bag))
        if count == 0
            push!(bagList,bag)
        end
    end
end

function updateBagGraph!(bagGraph,bagList,parent_bag,child_bags, child_weights)
    # add new vertices
    original_size = length(vertices(bagGraph))
    new_size = length(bagList)

    if new_size > original_size
        num_new_vertices = new_size - original_size
        add_vertices!(bagGraph,num_new_vertices)
    end

    # add new edges based on order in bagList
    parent_index = findall(bagList .== parent_bag)[1]

    for i in 1:length(child_bags)
        child_bag = child_bags[i]
        child_weight = child_weights[i]
        child_index = findall(bagList .== child_bag)[1]
        add_edge!(bagGraph,parent_index,child_index,child_weight)
    end
end


function getTotalBagsIn(bagGraph,parent)
    count = 0
    for child in neighbors(bagGraph,parent)
        # add child weight to count
        child_weight = weights(bagGraph)[parent,child]
        count += child_weight* (1 + getTotalBagsIn(bagGraph,child))
    end
    return count
end
