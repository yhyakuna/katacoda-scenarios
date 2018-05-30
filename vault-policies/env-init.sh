#!/usr/bin/env bash

# Get Vault
export VAULT=0.10.1

echo "Installing Vault..."
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip

unzip vault_${VAULT}_linux_amd64.zip
chmod +x vault
mv vault /usr/bin
chmod 0755 /usr/bin/vault
chown root:root /usr/bin/vault

touch base.hcl

echo "Starting the Vault server..."
# Run Vault
vault server -dev -dev-root-token-id="root"
