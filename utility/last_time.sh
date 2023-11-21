#!/bin/bash

# Specify the path to your file
file_path="$PWD/log.txt"

# Extract the last line and get the timestamp using awk
last_timestamp=$(tail -n 1 "$file_path" | awk '{print $1, $2}')

echo "Last timestamp: $last_timestamp"