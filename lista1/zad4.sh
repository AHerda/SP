#!/bin/bash

# Check if the directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory_path=$1

if [ ! -d "$directory_path" ]; then
    echo "Error: $directory_path is not a directory"
    exit 1
fi

declare -A words_lines

while read -r file; do
    declare -i i=1
    while read -r line; do
        while read -r word; do
            words_lines["$word"]+="$file:$i:$line"$'\n'
        done < <(echo "$line" | tr -s '[:space:]' '\n' | sort -u)
        i+=1
    done < "$file"
done < <(find "$directory_path" -type f)

while read -r word; do
    echo "$word:"

    for line in "${words_lines["$word"]}"; do
        echo "$line"
    done
done < <(echo "${!words_lines[@]}" | tr '[:space:]' '\n' | sort)
