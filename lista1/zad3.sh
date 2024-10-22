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

declare -A word_count

# Find all files in the directory and its subdirectories
while IFS= read -r file; do
    # Extract words from the file and get unique words
    words=$(tr -s '[:space:]' '\n' < "$file" | sort -u)
    for word in $words; do
        word_count["$word"]=$((word_count["$word"] + 1))
    done
done < <(find "$directory_path" -type f)

# Print the word counts
for word in "${!word_count[@]}"; do
    echo "$word: ${word_count[$word]}"
done
