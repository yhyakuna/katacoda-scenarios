#!/usr/bin/env bash

# Get Vault
export VAULT=0.10.2
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip

unzip vault_${VAULT}_linux_amd64.zip && rm vault_${VAULT}_linux_amd64.zip
install -c -m 0755 vault /usr/bin

apt-get install -y jq &&

# Run Vault
vault server -dev -dev-root-token-id="root" > /dev/null
