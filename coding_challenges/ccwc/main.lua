for i = 1, #arg do
    if arg[i] == "-c" then
        local f = assert(io.open(arg[i + 1], "rb"))
        local count = 0
        while true do
            local bytes = f:read(1)
            if not bytes then break end
            count = count + 1
        end
        f:close()
        print(count, arg[i + 1])
    elseif arg[i] == "-l" then
        local f = assert(io.open(arg[i + 1], "rb"))
        local count = 0
        for line in f:lines() do
            count = count + 1
        end
        f:close()
        print(count, arg[i + 1])

    elseif arg[i] == "-w" then
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
        local line = f:read("*l") -- reads line without newline

        while line do
            count = count + string.len(line)  
            local nextLine = f:read("*l")
            if nextLine then
                count = count + 1
            end
            line = nextLine
        end

        print(count, arg[i + 1])
        f:close()
    else
        
    end
end
