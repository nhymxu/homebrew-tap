import http.client
import json

'''
def updae_3utools():
    import httpx

    headers = {
        'User-Agent': 'User-Agent: Mozilla / 5.0 (Windows NT 10.0; WOW64; Trident / 7.0; rv:11.0) like Gecko',
        'Accept': '*/*',
        'Accept-Language': 'zh-cn',
        'Content-Type': 'text/plain',
    }

    params = {
        'params': 'jMlGektjFIsB9wleI7nJvQ0Sobre8lSoULy9Xs6YF9wWKO3PFOwHUZypyFJh98kIXALhwYyuDmnH3oG6ZLlN1G2U0nl40ULGfJRiIbcVY/hlNVCsMpMMrrqXokOm3zQb2CXqpBvhIM5ch94nwXJYQBpdhKPS3qxL6gUR/Syqa+c=',
    }

    response = httpx.get('https://tools.3u.com/hotUpdate/winpcupdate', params=params, headers=headers)
'''

conn = http.client.HTTPSConnection('tools.3u.com')
headers = {
    'User-Agent': 'User-Agent: Mozilla / 5.0 (Windows NT 10.0; WOW64; Trident / 7.0; rv:11.0) like Gecko',
    'Accept': '*/*',
    'Accept-Language': 'zh-cn',
    'Content-Type': 'text/plain',
}
conn.request(
    'GET',
    '/hotUpdate/winpcupdate?params=jMlGektjFIsB9wleI7nJvQ0Sobre8lSoULy9Xs6YF9wWKO3PFOwHUZypyFJh98kIXALhwYyuDmnH3oG6ZLlN1G2U0nl40ULGfJRiIbcVY%2FhlNVCsMpMMrrqXokOm3zQb2CXqpBvhIM5ch94nwXJYQBpdhKPS3qxL6gUR%2FSyqa%2Bc%3D',
    headers=headers
)
response = conn.getresponse()
resp_body = response.read()
data = json.loads(resp_body)

new_version = None
if data['code'] == 0 and data['message'] == 'success':
    new_version = data['data']['newVersion']

print(new_version)
