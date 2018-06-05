docker run -d -p 8200:8200 -e VAULT_ADDR='http://127.0.0.1:8200' --name vault vault:latest

alias vault='docker exec -it vault vault "$@"'

apt-get install -y jq

docker exec -it postgres psql -U postgres -c 'CREATE DATABASE myapp;' &>/dev/null
