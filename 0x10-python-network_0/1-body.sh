#!/bin/bash
# Send a GET request to the URL and display the body for a 200 status code response
curl -s -o /tmp/body.txt -w "%{http_code}" "$1" && [ $(cat /tmp/body.txt) -eq 200 ] && cat /tmp/body.txt
