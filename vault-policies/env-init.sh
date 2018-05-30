#!/usr/bin/env bash

# Get Vault
export VAULT=0.10.1
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip

unzip vault_${VAULT}_linux_amd64.zip && rm vault_${VAULT}_linux_amd64.zip
chmod +x vault
mv vault /usr/bin
chmod 0755 /usr/bin/vault
chown root:root /usr/bin/vault

rm vault_${VAULT}_linux_amd64.zip

# Run Vault
vault server -dev -dev-root-token-id="root"
