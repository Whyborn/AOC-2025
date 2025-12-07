begin
    inp = stack(collect.(split(read("day7-input.txt", String), "\n", keepempty=false)))

    proc_inp = map(x -> x == '^' ? -1 : 0, inp)
    proc_inp[findfirst(inp .== 'S')] = 1
    for j = 1:size(proc_inp, 2) - 1
       for i = 1:size(proc_inp, 1)
           if proc_inp[i, j] > 0
               if proc_inp[i, j+1] == -1
                   proc_inp[i-1, j+1] += proc_inp[i, j]
                   proc_inp[i+1, j+1] += proc_inp[i, j]
               else
                   proc_inp[i, j+1] += proc_inp[i, j]
               end
           end
       end
    end

    total = 0
    for ind in CartesianIndices(proc_inp)
        i, j = Tuple(ind)
        if proc_inp[i, j] == -1 && proc_inp[i, j-1] > 0
            global total += 1
        end
    end

    println("Part 1 solution: $(total)")
    println("Part 2 solution: $(sum(proc_inp[:, end]))")
end
