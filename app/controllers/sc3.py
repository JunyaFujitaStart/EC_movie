# This Python file uses the following encoding: utf-8
import sys
import requests
from bs4 import BeautifulSoup

url = "https://bokete.jp/boke/hot"
html = requests.get(url)
soup = BeautifulSoup(html.content, "html.parser")
for element in soup.find_all(class_="photo-content"):
    img = str(element.find_all('img'))

    sys.stdout.write(img)  # 標準出力へ書き込み
    sys.stderr.write('failed')  # 標準エラー出力へ書き込み