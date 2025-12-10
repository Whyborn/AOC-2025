using Combinatorics
begin
    inp = [split(l, " ") for l in split(read("day10-input.txt", String), "\n", keepempty=false)]

    lights = [collect(l[2:end-1]) .== '#' for l in getindex.(inp, 1)]

    buttons = [[zeros(Bool, length(light)) for _ in 1:length(line) .- 2] for (line, light) in zip(inp, lights)]

    for (i, line) in enumerate(inp)
        for (j, b) in enumerate(line[2:end-1])
            for ind in split(b[2:end-1], ",")
                buttons[i][j][parse(Int, ind)+1] = true
            end
        end
    end

    total = 0
    for (l, b) in zip(lights, buttons)
        correct_seq = false
        n = 0
        while !(correct_seq)
            n += 1
            for comb = combinations(b, n)
                _light = deepcopy(l)
                for c in comb
                    _light = _light .⊻ c
                end
                if all(.!_light)
                    correct_seq = true
                    break
                end
            end
           
            if n > length(b)
                println("Something went wrong")
                break
            end
        end
        global total += n
    end
    total

    println("Part 1 solution: $total")
end


