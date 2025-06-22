#!/bin/bash

# API endpoint
url="https://pokeapi.co/api/v2/pokemon/pikachu"

# Output files
output_file="data.json"
error_file="errors.txt"

# Make the API request
curl -s -o "$output_file" -w "%{http_code}" "$url" > status_code.tmp

# Read the status code
status=$(cat status_code.tmp)
rm status_code.tmp

# Check if the request was successful (HTTP 200)
if [ "$status" -eq 200 ]; then
    echo "Pikachu data saved to $output_file"
else
    echo "Error: Request failed with status code $status" >> "$error_file"
    echo "Failed to fetch Pikachu data. See $error_file for details."
fi
