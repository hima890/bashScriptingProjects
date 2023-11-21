#!/bin/bash

# Example of compressing a directory using gzip

directory_to_compress="/home/ahmed/Desktop/Projects"
output_archive="/home/ahmed/Desktop/buckup/buckup.tar.gz"

# Check if the directory exists
if [ -d "$directory_to_compress" ]; then
    # Use tar to create a compressed archive
    tar -czf "$output_archive" -C "$(dirname "$directory_to_compress")" "$(basename "$directory_to_compress")"
    echo "Compression completed: $output_archive"
else
    echo "Error: The specified directory does not exist."
fi