begin
    inp = read("day1_input.txt")

    ranges = [split(ids, "-") for ids in split(inp, ",")]

    sum = 0
    for r in ranges
        st, en = parse.(Int, r)
        for id in st:en
            asstr = string(id)
            len = length(asstr)
            if asstr[1:end÷2] * asstr[1:end÷2] == asstr
                sum += id
            end
        end
    end

    println("Part 1 solution: $(sum)")
    
    sum = 0
    for r in ranges
       st, en = parse.(Int, r)
       for id in st:en
           asstr = string(id)
           len = length(asstr)
           for i = 1:len÷2
               if mod(len, i) == 0
                   if join([asstr[1:i] for _ = 1:len÷i]) == asstr
                       sum += id
                       break
                   end
               end
           end
       end
    end

    println("Part 2 solution: $(sum)")
end
