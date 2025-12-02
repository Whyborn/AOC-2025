begin
    inp = readlines("day1_input.txt")

    start = 50; count_pt1 = 0; count_pt2 = 0
    for line in inp
       dir = line[1] == 'R' ? 1 : -1
       num = parse(Int, line[2:end])
       while num >= 100
           num -= 100
           count_pt2 += 1
       end
       if num > 0 && start > 0
           if (start + (dir * num)) <= 0 || (start + (dir * num)) > 99
               count_pt2 += 1
               println("Line $(line) with start $(start) triggered a 0")
           end
       end
       start = mod(start + (num * dir), 100)
       if start == 0
           count_pt1 += 1
       end
    end
    println("Part 1: $(count_pt1)")
    println("Part 2: $(count_pt2)")
end
