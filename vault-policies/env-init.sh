#!/usr/bin/env bash

# Get Vault
VAULT=0.10.1

echo "Installing Vault..."
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip

unzip vault_${VAULT}_linux_amd64.zip
sudo chmod +x vault
sudo mv vault /usr/bin
sudo chmod 0755 /usr/bin/vault
sudo chown root:root /usr/bin/vault

echo "Starting the Vault server..."
# Run Vault
vault server -dev -dev-root-token-id="root"
