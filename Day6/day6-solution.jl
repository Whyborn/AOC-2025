begin

    inp = split(read("day6-input.txt", String), "\n", keepempty=false)
    nums = inp[1:end-1]; ops = split(inp[end], " ", keepempty=false)

    # Part 1
    vals_for_pt1 = [parse.(Int, split(l, " ", keepempty=false)) for l in nums]

    total = 0
    for (i, op) in enumerate(ops)
        vals_for_op = [vals[i] for vals in vals_for_pt1]
        if op == "*"
            global total += prod(vals_for_op)
        elseif op == "+"
            global total += sum(vals_for_op)
        end
    end

    println("Part 1 solution: $(total)")

    # Part 2
    total = 0; vals = Int[]; op_count = length(ops)
    for i = length(nums[1]):-1:1
        val_str = ""
        is_delim = true
        for j = 1:length(nums)
            if nums[j][i] != ' '
                val_str *= nums[j][i]
                is_delim = false
            end
        end

        if !is_delim
            push!(vals, parse(Int, val_str))
        else
            if ops[op_count] == "*"
                global total += prod(vals)
            elseif ops[op_count] == "+"
                global total += sum(vals)
            end
            empty!(vals)
            global op_count -= 1
        end
    end

    # Do op last time, as left-most doesn't have a delim
    if ops[1] == "*"
        total += prod(vals)
    elseif ops[2] == "+"
        total += sum(vals)
    end

    println("Part 2 solution: $(total)")
end
