#!/bin/bash
# This script takes a URL as an argument, sends a request to the URL using curl in silent mode (-s), 
# and displays the size of the response body in bytes.

if [ $# -ne 1 ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

url="$1"
response_file=$(mktemp)
curl -s -o "$response_file" "$url"

if [ $? -ne 0 ]; then
  echo "Error: Failed to fetch the URL"
  exit 1
fi

body_size=$(wc -c < "$response_file")
echo "$body_size"
rm -f "$response_file"
