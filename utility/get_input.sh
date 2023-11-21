#!/bin/bash

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

# Capture the result using command substitution
value=$(getInput)

# Display the result
echo "Returned value: $value"

# Example usage of the return value
if [ "$value" -eq 0 ]; then
    echo "Backup initiated."
elif [ "$value" -eq 1 ]; then
    echo "Backup canceled."
else
    echo "Invalid input. Exiting."
fi
