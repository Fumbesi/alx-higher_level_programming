#!/bin/bash

# Send a GET request to the URL and display only the status code
curl -s -o /tmp/status_code.txt -w "%{http_code}" "$1"

# Display the status code
cat /tmp/status_code.txt

# Clean up the temporary file
rm -f /tmp/status_code.txt
