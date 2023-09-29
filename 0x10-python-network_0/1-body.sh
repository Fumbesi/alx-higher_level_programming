#!/bin/bash

# Send a GET request to the URL, discard headers, and display the body for a 200 status code response
curl -s -X GET -I "$1" | awk 'NR == 1 {if ($2 == 200) {body=1} else {body=0}} NR > 1 {if (body) print}'
