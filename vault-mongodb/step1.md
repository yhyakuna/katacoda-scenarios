This tutorial demonstrate the Vault installation on Ubuntu. For other operating systems, refer to [Install Vault](https://learn.hashicorp.com/vault/getting-started/install).

> Enter the following command into the terminal, or click on the command (`⮐`) to automatically copy it into the terminal and execute to downloads the Vault binary for Linux.


```
wget https://releases.hashicorp.com/vault/1.7.0-rc1/vault_1.7.0-rc1_linux_amd64.zip
```{{execute}}


After downloading Vault, unzip the package, and go ahead and remove the zip file:

```
unzip vault_1.7.0-rc1_linux_amd64.zip && rm vault_1.7.0-rc1_linux_amd64.zip
```{{execute}}

Vault runs as a single binary named vault. Any other files in the package can be safely removed and Vault will still function.

```
ls -al | grep vault
```{{execute}}

Finally, make sure that the vault binary is available on the `PATH`:

```
install -c -m 0755 vault /usr/bin
```{{execute}}

**That's it!**

Execute the following command to verify the vault version:

```
vault version
```{{execute}}
