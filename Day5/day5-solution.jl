function merge_ranges(ranges)
    new_ranges = Vector{Int}[]
    merges_required = true
    while merges_required
       merges_required = false
       for i = 1:length(ranges)
           merge_found = false
           j = 1
           while (!merge_found && (j <= length(ranges)) && (i <= length(ranges)))
               if i != j
                   if ranges[j][1] <= ranges[i][1] <= ranges[j][2]
                       # Start is in the middle of another range
                       ranges[i][1] = min(ranges[i][1], ranges[j][1])
                       ranges[i][2] = max(ranges[i][2], ranges[j][2])
                       deleteat!(ranges, j)
                       merge_found = true
                       merges_required = true
                   end
               end
               j += 1
           end
       end
    end
    ranges
end

function read_inp(inp)
    fresh, avail = split(inp, "\n\n")
    fresh_ranges = [parse.(Int, split(l, "-", keepempty=false)) for l in split(fresh, "\n")]
    avail = parse.(Int, split(avail, "\n", keepempty=false))
    fresh_ranges, avail
end

begin
    inp = fresh, avail = read_inp(read("day5-input.txt", String))
    
    total = 0
    for a in avail
        for fresh_range in fresh
            if fresh_range[1] <= a <= fresh_range[2]
                global total += 1
                break
            end
        end
    end

    println("Part 1 solution: $(total)")

    merged_fresh = merge_ranges(fresh)
    total = sum(r[2] - r[1] + 1 for r in merged_fresh)
    println("Part 2 solution: $(total)")
end
