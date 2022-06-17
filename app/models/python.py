import requests
from bs4 import BeautifulSoup


url = "https://bokete.jp/"
html = requests.get(url)
soup = BeautifulSoup(html.content, "html.parser")


for element in soup.find_all("img"):    
    src = str(element.get('src'))
    f = open('myfile.txt', 'a')
    f.write(src+"\n")
    f.close()