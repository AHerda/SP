#!/bin/bash

# Check if the directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory_path="${1}"

if [ ! -d "$directory_path" ]; then
    echo "Error: $directory_path is not a directory"
    exit 1
fi

# Find words that occur more than once in a line
grep -r -n -E '\b(\w+)\b.*\b\1\b' "$directory_path" | while IFS=: read -r file line_number line_content; do
    tr '[:space:]' '\n' <<< "$line_content" | sort | uniq -d
    echo "$file:$line_number:$line_content"
done
