#!/bin/bash

#############################################################
# Function to convert a timestamp to seconds since the epoch
timestamp_to_seconds()
{
    date -d "$1" +%s
}

# Write the logging messages to the log file
writeTheMessages()
{
    local file_path=$1   # The path to the file
    local message=$2     # The user message

    # Check if the file exists at the specified path
    if [ ! -e "$file_path" ]; then
        touch "$file_path"
    fi

    if [ ! -s "$file_path" ];
    then
        current_time=$(date +"%Y-%m-%d %H:%M:%S")
        echo "$current_time" >> "$file_path"
    fi

    if [ "$message" ];
    then
        echo "$message" >> "$file_path"  # Print the message to the file
    fi
}

getInput() 
{
    # Prompt the user for input with the -p option
    read -p "Time to backup the project folder! Do you want to backup it now? (y/yes/n/no): " ans

    if [ "$ans" == "y" ] || [ "$ans" == "yes" ]; then
        echo 0
    elif [ "$ans" == "n" ] || [ "$ans" == "no" ]; then
        echo 1
    else
        echo -1
    fi
}

#############################################################
# Code main script

# Check if the configuration file exists
config_file="config.txt"
if [ ! -e "$config_file" ]; then
    echo "Error: Configuration file not found."
    exit 1
fi

# Read project and backup folder paths from the configuration file
source "$config_file"

writeTheMessages $file_path

# Get the current timestamp
current_time=$(date +"%Y-%m-%d %H:%M:%S")
current_time_2=$(date +"%H:%M:%S")
# Extract the last line and get the timestamp using awk
last_timestamp=$(tail -n 1 "$file_path" | awk '{print $1, $2}')

# Convert timestamps to seconds since the epoch
current_timestamp_seconds=$(timestamp_to_seconds "$current_time")
previous_timestamp_seconds=$(timestamp_to_seconds "$last_timestamp")

# Calculate the time difference in seconds
time_difference=$((current_timestamp_seconds - previous_timestamp_seconds))


# Check if 24 hours have passed (86400 seconds)
if [ "$time_difference" -ge 86400 ]; then
    # Capture the result using command substitution
    value=$(getInput)
    if [ "$value" -eq 0 ]; then
        writeTheMessages $file_path ""$current_time_2" Backup initiated."

        # Check if the directory exists
        if [ -d "$directory_to_compress" ];
        then
            # Check if the tar file exists before attempting to delete
            if [ -d "$archive_folder" ];
            then
                rm -rf "$archive_folder"/*
                writeTheMessages $file_path ""$current_time_2" The old backup has been deleted"
            fi

            # Use tar to create a compressed archive
            # Specify the path to your backup folder
            output_archive="/home/ahmed/Desktop/buckup/"$current_time".tar.gz"
            tar -czf "$output_archive" -C "$(dirname "$directory_to_compress")" "$(basename "$directory_to_compress")"
            writeTheMessages $file_path ""$current_time_2" Compression completed: $output_archive"
            writeTheMessages $file_path "$current_time"
        else
            writeTheMessages $file_path ""$current_time_2" Error: The specified directory does not exist."
            writeTheMessages $file_path "$current_time"
        fi

    elif [ "$value" -eq 1 ]; then
        writeTheMessages $file_path ""$current_time_2" Backup canceled."
        writeTheMessages $file_path "$current_time"
    else
        writeTheMessages $file_path ""$current_time_2" Invalid input. Exiting."
        writeTheMessages $file_path "$current_time"
        exit 1
    fi


fi