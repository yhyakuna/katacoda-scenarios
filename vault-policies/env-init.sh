docker run -d -p 8200:8200 -e VAULT_ADDR='http://127.0.0.1:8200' --name vault vault:latest
wait $!
docker logs vault > root_token.txt

grep 'Root Token:' root-token.txt | awk '{print $NF}' > root_token.txt

alias vault='docker exec -it vault vault "$@"'

vault login $(cat root_token.txt)

apt-get install -y jq
