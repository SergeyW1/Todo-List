#!/usr/bin/env sh

# остановить публикацию при ошибках
SET -e

# сборка
npm run build

# переход в каталог сборки
CD dist

git init
git add -A
git commit -m 'deploy'

# если вы публикуете по адресу https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:SergeyW1/hello-world.git master:gh-pages

CD -