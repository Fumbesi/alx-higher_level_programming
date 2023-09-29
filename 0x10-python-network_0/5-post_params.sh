#!/bin/bash
# Send a POST request with parameters and display the body of the response
curl -s -X POST -d "email=$email&subject=$subject" "$url"
