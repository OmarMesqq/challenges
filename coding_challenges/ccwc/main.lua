-- Simulates wc -c flag (counts bytes)
local function countBytes(content)
    local count = 0
    for _ in string.gmatch(content, ".") do
        count = count + 1
    end
    return count
end

-- Simulates wc -l flag (counts lines)
local function countLines(content)
    local count = 0
    for _ in string.gmatch(content, "[^\n]*\n?") do
        count = count + 1
    end
    return count
end

-- Simulates wc -w flag (counts words)
local function countWords(content)
    local count = 0
    for _ in string.gmatch(content, "%S+") do
        count = count + 1
    end
    return count
end

-- Simulates wc -m flag (counts characters)
local function countChars(content)
    return string.len(content)
end


-- Main loop
local i = 0
local option
local filename
for j = 1, #arg do
    i = i + 1
end
if i >= 2 then
    option = arg[1]
    filename = arg[2]
else 
    filename = arg[1]
end


if option == "-c" or option == "-l" or option == "-w" or option == "-m" then
    local f = assert(io.open(filename, "rb"))
    local content = f:read("*a")
    f:close()
    local count = 0
    if option == "-c" then
        count = countBytes(content)
    elseif option == "-l" then
        count = countLines(content)
    elseif option == "-w" then
        count = countWords(content)
    elseif option == "-m" then
        count = countChars(content)
    end
    print(count, filename)
else
    local f = assert(io.open(filename, "rb"))
    local content = f:read("*a")
    f:close()
    local count = 0
    local lines = countLines(content)
    local words = countWords(content)
    local bytes = countBytes(content)
    print(lines, words, bytes, filename)
end
