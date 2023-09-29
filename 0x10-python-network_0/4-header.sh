#!/bin/bash
# Send a GET request to the URL with the custom header and display the body of the response
curl -s -H "X-School-User-Id: 98" "$1"
