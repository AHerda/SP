#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <Revision no.> <Repository URL>"
  exit 1
fi

# Det the arguments
revision=$1
url=$2

# Make tmep dir
temp_dir=$(mktemp -d)

# Export the files from svn repository
svn export --force -r "$revision" "$url" "$temp_dir" >/dev/null 2>&1

if [ $? -ne 0 ]; then
  echo "Error while exporting files from repository"
  rm -rf "$temp_dir"
  exit 1
fi

find "$temp_dir" -type f | while read -r file; do
  # Read each file and extract words
  tr -s '[:space:]' '\n' <"$file"
done | sort | uniq -c | sort -nr

rm -rf "$temp_dir"
