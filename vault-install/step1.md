Vault is distributed as a [binary package](https://www.vaultproject.io/downloads.html) for all supported platforms and architectures. \

To install Vault, find the appropriate package for your system and download it. (NOTE: Vault is packaged as a zip archive.)  The following command downloads the `0.10.1` of the Vault binary for Linux:

```
export VAULT=0.10.1
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip
```{{execute}}


After downloading Vault, unzip the package:

```
unzip vault_${VAULT}_linux_amd64.zip && rm vault_${VAULT}_linux_amd64.zip
```{{execute}}

Vault runs as a single binary named vault. Any other files in the package can be safely removed and Vault will still function.

```
ls -al | grep vault
```{{execute}}

Finally, make sure that the vault binary is available on the `PATH`:

```
mv vault /usr/bin
```{{execute}}

Execute the following command to check the vault version:

```
vault version
```{{execute}}


```
vault server -dev -dev-root-token-id="root"
```{{execute}}
