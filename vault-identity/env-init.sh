#!/usr/bin/env bash
curl -s -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip

curl -s -L -o ~/vault.zip https://releases.hashicorp.com/vault/1.1.1/vault_1.1.1_linux_amd64.zip &&
unzip -d ~/.bin ~/vault.zip && rm ~/vault.zip

export VAULT_ADDR='http://127.0.0.1:8200'

docker run --name mysql-rewrap -p 3306:3306 -v ~/rewrap-data/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ROOT_HOST=% -e MYSQL_DATABASE=my_app -e MYSQL_USER=vault -e MYSQL_PASSWORD=vaultpw -d mysql/mysql-server:5.7

apt-get install -y jq

ssh root@host01 "curl -L http://assets.joinscrapbook.com/unzip -o /usr/bin/unzip && chmod +x /usr/bin/unzip && curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/1.1.1/vault_1.1.1_linux_amd64.zip && unzip -d  /usr/bin/ ~/vault.zip && rm ~/vault.zip && docker run --name mysql-rewrap -p 3306:3306 -v ~/rewrap-data/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ROOT_HOST=% -e MYSQL_DATABASE=my_app -e MYSQL_USER=vault -e MYSQL_PASSWORD=vaultpw -d mysql/mysql-server:5.7 && export VAULT_ADDR='http://127.0.0.1:8200' && apt-get install -y jq  &"
