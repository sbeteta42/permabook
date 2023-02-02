import sys
import requests
import lxml.html

def fuzz(url, param_name, count):
    for id in range(int(count)):
        params = {param_name: id}
        r = requests.get(url, params=params)
        if r.status_code == 200:
            t = lxml.html.parse(r.url)
            print(f"{r.url} :: {t.find('.//title').text}")

if __name__ == "__main__":
    try:
        fuzz(sys.argv[1], sys.argv[2], sys.argv[3])
    except IndexError:
        print("usage: wp-fuzz.py <url> <param_name> <count>")
