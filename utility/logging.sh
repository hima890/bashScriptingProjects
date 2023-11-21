#!/bin/bash

# Log the last update timestamp to file function

# Write the loggin messages to the log file
writeTheMessages()
{
    local file_path=$1 # The path to the file
    local message=$2 # The user message
	

	# Check if the if the file exists at the specified path
    if ! [ -e "$file_path" ];
	then
        echo "File not found, New file has been cearted"
		touch "$file_path"
    fi

	echo "Start loggin" >> "$file_path" 
	echo "$message" >> "$file_path" # Print the time to the file
	

}

# writeTheMessages "$PWD/log.txt"
current_time=$(date +"%Y-%m-%d %H:%M:%S")
writeTheMessages "$PWD/log.txt" "$current_time swrfeas wsead"