#!/usr/bin/python3
"""
A Python script that lists the commits of a repository by a given owner on GitHub.
"""

import requests
import sys

if __name__ == "__main__":
    repo_name = sys.argv[1]
    owner_name = sys.argv[2]

    url = f"https://api.github.com/repos/{owner_name}/{repo_name}/commits"
    params = {'per_page': 10}
    response = requests.get(url, params=params)

    try:
        data = response.json()
        for commit in data:
            sha = commit.get('sha')
            author = commit.get('commit').get('author').get('name')
            print(f"{sha}: {author}")
    except ValueError:
        pass
