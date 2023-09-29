#!/bin/bash
# This script sends a GET request to a URL, retrieves and displays the body of the response if it has a 200 status code.
curl -s -X GET -I "$1" | awk 'NR==1{if($2 == 200) system("curl -s "$1)}'
