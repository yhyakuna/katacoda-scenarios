Download the Vault binary:

```
export VAULT=0.10.1
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip
```{{execute}}

Extract the zip file:

```
unzip vault_${VAULT}_linux_amd64.zip && rm vault_${VAULT}_linux_amd64.zip
```{{execute}}


```
ls -al | grep vault
```{{execute}}

Move the `vault` unde `/usr/bin` so that it's in the PATH:

```
mv vault /usr/bin
chmod 0755 /usr/bin/vault
chown root:root /usr/bin/vault
```{{execute}}


```
rm vault_${VAULT}_linux_amd64.zip
```{{execute}}


```
vault server -dev -dev-root-token-id="root"
```{{execute}}
