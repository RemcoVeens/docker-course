if [ "$(docker ps -a -q -f name=caddy)" ]; then
    docker stop caddy caddy1 caddy2
    docker rm caddy caddy1 caddy2
fi
if [ "$(docker network ls -q -f name=caddytest)" ]; then
    docker network rm caddytest
fi

docker network create caddytest
docker run -d --network caddytest --name caddy1 -v $PWD/index1.html:/usr/share/caddy/index.html caddy
docker run -d --network caddytest --name caddy2 -v $PWD/index2.html:/usr/share/caddy/index.html caddy
docker run -d --network caddytest --name caddy -p 8991:80 -v $PWD/Caddyfile:/etc/caddy/Caddyfile caddy
