for i = 1, #arg do
    if arg[i] == "-c" then -- OK
        local f = assert(io.open(arg[i + 1], "rb"))
        local count = 0
        while true do
            local bytes = f:read(1)
            if not bytes then break end
            count = count + 1
        end
        f:close()
        print(count, arg[i + 1])
    elseif arg[i] == "-l" then -- OK
        local f = assert(io.open(arg[i + 1], "rb"))
        local count = 0
        for line in f:lines() do
            count = count + 1
        end
        f:close()
        print(count, arg[i + 1])

    elseif arg[i] == "-w" then -- OK
        local f = assert(io.open(arg[i + 1], "rb"))
        local count = 0
        for line in f:lines() do
            for _ in string.gmatch(line, "%S+") do -- matches 1 or more non space chars
                count = count + 1
            end
        end
        f:close()
        print(count, arg[i + 1])
    elseif arg[i] == "-m" then
        local f = assert(io.open(arg[i + 1], "rb"))
        local count = 0
        local line = f:read("*l")

        while line do
            count = count + string.len(line)  -- Count characters in the line
            local nextLine = f:read("*l")
            if nextLine then
                count = count + 1  -- Add 1 for the newline character
            end
            line = nextLine
        end

        print(count, arg[i + 1])
        f:close()
    
    end
    
end