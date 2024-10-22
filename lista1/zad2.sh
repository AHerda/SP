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

# Find all files in the given directory and its subdirectories
find "$directory_path" -type f | while read -r file; do
    # Read each file and extract words
    tr -s '[:space:]' '\n' < "$file"
done | sort | uniq -c | sort -nr
