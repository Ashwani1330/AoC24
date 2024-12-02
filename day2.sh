#!/bin/bash

# Empty array to store user input
input_matrix=()
safe_count=0

while true; do
    read row
    if [[ -z "$row" ]]; then
        break
    fi

    input_matrix+=("$row")
done

is_safe_row() {
    local -a row=($1)  # Convert the row into an array of numbers
    local len=${#row[@]}

    if ((len < 2)); then
        return 1  # Not safe
    fi

    local ascending=true
    local descending=true

    for ((i = 1; i < len; i++)); do
        local diff=$((row[i] - row[i-1]))
        
        if ((diff < -3 || diff > 3 || diff == 0)); then
            return 1  # Not safe
        fi

        if ((diff < 0)); then
            ascending=false
        elif ((diff > 0)); then
            descending=false
        fi
    done

    if [[ $ascending == false && $descending == false ]]; then
        return 1
    fi

    return 0  # Safe
}

problem_dampener() {
    local -a org_row=($1)
    local len=${#org_row[@]}

    for ((i = 0; i < len; i++)); do
        local -a new_row=("${org_row[@]:0:i}" "${org_row[@]:i+1}")

        # Check if the new row is safe
        is_safe_row "${new_row[*]}"
        if [[ $? -eq 0 ]]; then
            return 0  # Safe after removing one element
        fi
    done

    return 1  # Not safe even after removing one element
}

# Analyze each report
for row in "${input_matrix[@]}"; do
    is_safe_row "$row"
    if [[ $? -eq 0 ]]; then
        ((safe_count++))  # Count as safe
    else
        problem_dampener "$row"
        if [[ $? -eq 0 ]]; then
            ((safe_count++))  # Count as safe if dampener works
        fi
    fi
done

# Output the total count of safe reports
echo $safe_count
