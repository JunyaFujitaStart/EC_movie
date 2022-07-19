f = open('myfile.txt', 'r')
f2 = open('img_url.txt', 'a')
lines = f.readlines()
for line in lines :
        img_src = line
        index = img_src.find('src')
        last = img_src.rfind('jpg')
        img_src = str(img_src[index+5:last+3])
        f2.write(img_src+"\n")
f2.close()
f.close()