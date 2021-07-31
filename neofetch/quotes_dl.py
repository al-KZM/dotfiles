import requests as req
import json

url = r"https://raw.githubusercontent.com/skolakoda/programming-quotes/master/src/data/quotes.json"
r = req.get(url)
as_json = json.loads(r.text)
with open('quotes.txt', 'w') as f:
    for entry in as_json:
        f.write(entry['en']+'\n')
