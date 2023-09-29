#!/bin/bash
# This script sends a GET request to a URL, retrieves and displays the size of the response body in bytes.
curl -sI "$1" | awk '/Content-Length/{print $2}'
