import requests

def ping_google():
    code = requests.get('http://google.com')
    if code.status_code == 200:
        return 'pong'
    return 'Run to the hills we couldn\'t talk to google'