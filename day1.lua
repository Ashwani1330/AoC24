-- day1

-- part 1
-- Initialize arrays
local left = {}
local right = {}

-- Input
while true do

    local line = io.read("*line")

    if line == "" then
        break
    end

    local a, b = line:match("(%d+)%s+(%d+)")

    if a and b then
        table.insert(left, tonumber(a))
        table.insert(right, tonumber(b))
    end
end

table.sort(left)
table.sort(right)

local function sum_differences(arr_left, arr_right)
    local total_sum = 0
    for i = 1, #arr_left do
        local difference = math.abs(arr_right[i] - arr_left[i])
        total_sum = total_sum + difference
    end
    return total_sum
end

local result = sum_differences(left, right)

print(result)


-- part 2
local function similarity_score(value, arr2)
    local count = 0
    local score = 1
    for i=1, #arr2 do
        if arr2[i] == value then
            count = count+1
        end
    end
    score=value*count
    return score
end

local total_score = 0

local function remove_duplicates(arr)
    local seen = {}
    local unique_arr = {}
    for _, value in ipairs(arr) do
        if not seen[value] then
            seen[value] = true
            table.insert(unique_arr, value)
        end
    end
    return unique_arr
end

left = remove_duplicates(left)

for _, value in ipairs(left) do
    local score = similarity_score(value, right)
    total_score = total_score+score
end

print(total_score)