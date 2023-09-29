#!/usr/bin/python3
"""
A Python script that fetches https://alx-intranet.hbtn.io/status using the
requests package and displays information about the response.
"""

import requests

if __name__ == "__main__":
    url = "https://alx-intranet.hbtn.io/status"
    
    response = requests.get(url)
    response_data = response.text
    
    print("Body response:")
    print("\t- type:", type(response_data))
    print("\t- content:", response_data)
