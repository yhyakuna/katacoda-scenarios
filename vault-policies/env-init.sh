#!/usr/bin/env bash

# Get Vault
VAULT=0.10.1
VAULT_ZIP=/vagrant/bin/vault_${VAULT}_linux_amd64.zip
mkdir -p /vagrant/bin
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip --quiet -O $VAULT_ZIP

cd /tmp
unzip -q $VAULT_ZIP >/dev/null
sudo chmod +x vault
sudo mv vault /usr/bin
sudo chmod 0755 /usr/bin/vault
sudo chown root:root /usr/bin/vault

# Run Vault
vault server -dev -dev-root-token-id="root"

export VAULT_ADDR=http://localhost:8200
vault login root
