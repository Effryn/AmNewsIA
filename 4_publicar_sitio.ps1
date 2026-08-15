# 4_publicar_sitio.ps1
# Corre esto DESDE DENTRO de la carpeta amnewsia-site/ (donde estan
# index.html, hero-video.mp4 y data/news.json).

git init
git branch -M main
git remote add origin https://github.com/Effryn/AmNewsIA.git

git add .
git status
# Revisa que solo aparezcan index.html, hero-video.mp4, data/news.json
# y las carpetas assets/ -- nada de .env, nada de bases de datos
# (no deberian existir siquiera en esta carpeta separada).

git commit -m "Sitio inicial de AmNewsIA"
git push -u origin main

# Habilita GitHub Pages por linea de comando, sirviendo desde la raiz
# de main (donde esta index.html):
gh api repos/Effryn/AmNewsIA/pages -X POST -f "source[branch]=main" -f "source[path]=/"

Write-Host "`nListo. En unos minutos deberia estar disponible en:" -ForegroundColor Green
Write-Host "https://effryn.github.io/AmNewsIA/" -ForegroundColor Cyan
