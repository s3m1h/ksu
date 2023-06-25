import requests
from bs4 import BeautifulSoup as bs
url = "https://www.ntboxmag.com"
req = requests.get(url + "/kategori/teknoloji/yazilim")


linkler = []
for i in range(20):
  soup = bs(req.content, 'html.parser')
  cards = soup('div','posts-listing posts-list')[0].find_all('h3','post__title typescale-1')
  for card in cards:
    link = url + card.find('a').get('href')
    linkler.append(link)
  next_page = url + "/kategori/teknoloji/yazilim" + f"/page/{i+1}/"
  req = requests.get(next_page)
print(linkler)

makaleler = []
count = 0
for link in linkler:
    req = requests.get(link)
    soup = soup = bs(req.content, 'html.parser')
    paragraf = soup('div','single-body single-body--wide entry-content typography-copy')[0].find_all('p')
    makale = ''
    for p in paragraf:
        makale += p.text
    makaleler.append(makale)
    with open(f"{count}.txt", "w",encoding="utf-8") as f:
        f.write(makale)
    count +=1
