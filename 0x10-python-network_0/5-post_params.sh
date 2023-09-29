#!/bin/bash
# Send a POST request with parameters and display the body of the response
# Set the URL and POST data
url="$1"
email="test@gmail.com"
subject="I will always be here for PLD"
curl -s -X POST -d "email=$email&subject=$subject" "$url"
