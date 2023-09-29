#!/bin/bash
# Send an OPTIONS request to the URL and display the allowed HTTP methods
curl -s -I -X OPTIONS "$1" | awk -F': ' '/Allow/{print $2}'
