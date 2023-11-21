#!/bin/bash

# Function to convert a timestamp to seconds since the epoch
timestamp_to_seconds() {
    date -d "$1" +%s
}

# Get the current timestamp
current_time=$(date +"%Y-%m-%d %H:%M:%S")

# Previous timestamp in the specified format
previous_timestamp="2023-11-20 13:17:32"

# Convert timestamps to seconds since the epoch
current_timestamp_seconds=$(timestamp_to_seconds "$current_time")
previous_timestamp_seconds=$(timestamp_to_seconds "$previous_timestamp")

# Calculate the time difference in seconds
time_difference=$((current_timestamp_seconds - previous_timestamp_seconds))

echo "Time difference: $time_difference seconds"
