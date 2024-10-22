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

# Replace all occurrences of 'a' with 'A' in all files within the directory
find "$directory_path" -type f -exec sed -i 's/a/A/g' {} +
