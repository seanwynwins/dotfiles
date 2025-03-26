import requests
from datetime import datetime
from dateutil import parser

def fetch_data(url):
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an error for bad responses (4xx or 5xx)
        return response.json()  # Parse JSON response
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

# Example usage
url = "https://jsonplaceholder.typicode.com/posts"  # Example API endpoint
data = fetch_data(url)
print(data)

def handle_data(data):
    if data is not None:
        # Assuming the JSON response is a list of items
        for item in data:
            print(f"Post ID: {item['id']}, Title: {item['title']}")  # Adjust keys based on your JSON structure

# Example usage
if data:
    handle_data(data)


def parse_iso8601(iso_string):
    try:
        # Using dateutil.parser to parse the ISO8601 string
        dt = parser.isoparse(iso_string)
        return dt
    except ValueError as e:
        print(f"Error parsing date: {e}")
        return None

# Example usage
iso_string = "2023-10-05T14:48:00Z"  # Example ISO8601 datetime string
parsed_date = parse_iso8601(iso_string)
if parsed_date:
    print(f"Parsed datetime: {parsed_date}")

