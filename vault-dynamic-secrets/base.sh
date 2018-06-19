docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=training -d postgres


curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/0.10.2/vault_0.10.2_linux_amd64.zip &&
unzip -d ~/.bin ~/vault.zip && rm ~/vault.zip



ssh root@host01 "curl -L http://assets.joinscrapbook.com/unzip -o /usr/bin/unzip && chmod +x /usr/bin/unzip && curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/0.10.2/vault_0.10.2_linux_amd64.zip && unzip -d  /usr/bin/ ~/vault.zip && rm ~/vault.zip"
ssh root@host01 "apt-get install jq -y"
