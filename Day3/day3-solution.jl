function max_joltage(banks, N)
    sum = 0
    for bank in banks
        joltages = [parse(Int, c) for c in bank]
        max_joltage = ""
        for i = 1:N
            joltage, loc = findmax(joltages[1:end-(N-i)])
            max_joltage *= string(joltage)
            joltages = joltages[loc+1:end]
        end
        sum += parse(Int, max_joltage)
    end
    sum
end

begin
    inp = readlines("day3-input.txt")

    println("Part 1 solution: $(max_joltage(inp, 2))")
    println("Part 2 solution: $(max_joltage(inp, 12))")
end
