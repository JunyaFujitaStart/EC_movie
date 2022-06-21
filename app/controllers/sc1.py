# This Python file uses the following encoding: utf-8
import sys
import requests
from bs4 import BeautifulSoup

url = "https://bokete.jp/boke/popular"
html = requests.get(url)
soup = BeautifulSoup(html.content, "html.parser")
for element in soup.find_all(class_="photo-content"):
    img = str(element.find_all('img'))

  # ファイルの読み書き（3行）  
  #  f = open('myfile.txt', 'a')
  #  f.write(img+"\n")
  #  f.close()
  
  
# url2 = "https://bokete.jp/boke/trend"
# html2 = requests.get(url2)
# soup2 = BeautifulSoup(html2.content, "html.parser")    
# for element2 in soup2.find_all(class_="photo-content"):
#     img2 = str(element2.find_all('img'))
    
#   sys.stdout.write(img2) 
    sys.stdout.write(img)  # 標準出力へ書き込み
    sys.stderr.write('failed')  # 標準エラー出力へ書き込み
