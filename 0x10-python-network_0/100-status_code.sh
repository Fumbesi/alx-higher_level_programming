#!/bin/bash
# Send a GET request to the URL and display only the status code
curl -s -o /tmp/status_code.txt -w "%{http_code}" "$"
