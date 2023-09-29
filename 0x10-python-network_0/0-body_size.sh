#!/bin/bash

# Check if the URL argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

# Store the URL in a variable
url="$1"

# Use curl to send a GET request to the URL and store the response in a temporary file
response_file=$(mktemp)
curl -s -o "$response_file" "$url"

# Check if curl encountered an error
if [ $? -ne 0 ]; then
  echo "Error: Failed to fetch the URL"
  exit 1
fi

# Get the size of the response body in bytes
body_size=$(wc -c < "$response_file")

# Display the size of the response body
echo "$body_size"

# Clean up the temporary file
rm -f "$response_file"
