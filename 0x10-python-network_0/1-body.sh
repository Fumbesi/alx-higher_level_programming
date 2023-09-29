#!/bin/bash
# This script sends a GET request to a URL, retrieves and displays the body of the response if it has a 200 status code.

# Send a GET request to the URL, discard headers, and display the body for a 200 status code response
curl -s -X GET -I "$1" | awk 'NR==1{if($2 == 200) system("curl -s "$1)}'
