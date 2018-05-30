#!/usr/bin/env bash

ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'


# Get Vault
export VAULT=0.10.1

echo "Installing Vault..."
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip

unzip vault_${VAULT}_linux_amd64.zip
chmod +x vault
mv vault /usr/bin
chmod 0755 /usr/bin/vault
chown root:root /usr/bin/vault

echo "Starting the Vault server..."
# Run Vault
vault server -dev -dev-root-token-id="root"

export VAULT_ADDR=http://localhost:8200
vault login root
