begin
    inp = [parse.(Int, split(l, ",")) for l in split(read("day8-input.txt", String), "\n", keepempty=false)]

    conn_lengths = ones(Float32, (length(inp), length(inp))) .* typemax(Float32)

    for i = 1:length(inp)
        for j = i+1:length(inp)
           conn_lengths[i, j] = sum([(inp[i][n] - inp[j][n])^2 for n = 1:3])
        end
    end

    order = sortperm(vec(conn_lengths));

    links = vec([CartesianIndex(i, j) for i = 1:length(inp), j = 1:length(inp)])[order]

    circuits = collect(1:length(inp))

    N = 0
    while length(unique(circuits)) > 1
        global N += 1
        i, j = Tuple(links[N])
        circuits[circuits .== circuits[j]] .= circuits[i]
        if N == 1000
            # Part 1 solution
            clengths = [count(circuits .== val) for val in unique(circuits)]
            global longest_3 = sort(clengths)[end-2:end]
        end
    end

    println("Part 1 solution: $(prod(longest_3))")

    last_conn_A, last_conn_B = Tuple(links[N])
    println("Part 2 solution: $(inp[last_conn_A][1] * inp[last_conn_B][1])")
end
