local cliFlags = {}

for i = 1, #arg do
    if arg[i] == "-c" then
        local f = assert(io.open(arg[i + 1], "rb"))
        local count = 0
        while true do
            local bytes = f:read(1)
            count = count + 1
            if not bytes then break end
        end
        print(count, arg[i + 1])
    end
end
