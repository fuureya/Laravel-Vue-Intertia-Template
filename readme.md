install package nodejs nya pakai perintah alpine berikut

docker exec -it php_app sh
apk update
apk add --no-cache nodejs npm
npm install

npm run build
