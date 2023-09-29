#!/usr/bin/python3
"""
A Python script that takes in a URL, sends a request to the URL, and displays
the body of the response. If the HTTP status code is greater than or equal to
400, it prints an error message with the HTTP status code.
"""

import requests
import sys

if __name__ == "__main__":
    url = sys.argv[1]

    response = requests.get(url)
    content = response.text
    status_code = response.status_code

    print(content if status_code < 400 else f"Error code: {status_code}")
