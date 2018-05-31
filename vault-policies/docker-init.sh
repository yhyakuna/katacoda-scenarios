docker run -d --name vault vault:latest

alias vault='docker exec -it vault-dev vault "$@"'
