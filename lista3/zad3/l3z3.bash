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

declare -A word_count

# Find all files in the directory and its subdirectories
while IFS= read -r file; do
  # Extract words from the file and get unique words
  words=$(tr -s '[:space:]' '\n' <"$file" | sort -u)
  for word in $words; do
    word_count["$word"]=$((word_count["$word"] + 1))
  done
done < <(find "$temp_dir" -type f)

# Print the word counts
for word in "${!word_count[@]}"; do
  echo "$word: ${word_count[$word]}"
done

rm -rf "$temp_dir"
