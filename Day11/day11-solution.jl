function run_connections(curr_device, devices, circuit, all_circuits)
    circuit = vcat(circuit, curr_device)
    if curr_device == "out"
       if "fft" ∈ circuit && "dac" ∈ circuit
           push!(all_circuits, circuit)
       end
    else
       for output in devices[curr_device]
           curr_circuits = run_connections(output, devices, circuit, all_circuits)
       end
    end
    curr_circuits
end

begin
    inp = [strip.(split(l, ":", keepempty=false)) for l in split(read("day11-input.txt", String), "\n", keepempty=false)]
    devices = Dict(device[1] => split(device[2], " ", keepempty=false) for device in inp)
    
    curr_circuits = []; start = "you"
    run_connections(start, devices, String[], curr_circuits)

    println("Part 1 solution: $(length(curr_circuits))")
end
                                
