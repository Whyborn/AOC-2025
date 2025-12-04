function find_movable(inp)
    movable = similar(inp, Bool)
    movable .= false
    for ind in CartesianIndices(inp)
        i, j = Tuple(ind)
        if inp[i, j] == '@'
            n = 0
            for ix = -1:1, jy = -1:1
                if checkbounds(Bool, inp, i+ix, j+jy) && inp[i+ix, j+jy] == '@'
                    n += 1
                end
            end
            if n < 5
                movable[i, j] = true
            end
        end
    end
    return movable
end

begin
    inp = stack(collect.(readlines("day4-input.txt")))

    println("Part 1 solution: $(count(find_movable(inp)))")

    total = 0
    while true
        tmp_inp = inp
        movable = find_movable(tmp_inp)
        if all(movable .== false)
           break
        end
        global total += count(movable)
        tmp_inp[movable] .= '.'
    end
    println("Part 2 solution: $(total)")
end
