Vault is distributed as a [binary package](https://www.vaultproject.io/downloads.html) for all supported platforms and architectures.

To install Vault, find the appropriate package for your system and download it. (NOTE: Vault is packaged as a zip archive.)  The following command downloads the `0.10.1` of the Vault binary for Linux:

```
export VAULT=0.10.1
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip
```{{execute}}


After downloading Vault, unzip the package, and go ahead and remove the zip file:

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

That's it!

Execute the following command to check the vault version:

```
vault version
```{{execute}}

At this point, you can run Vault in development mode. In this mode, Vault runs entirely in-memory and starts unsealed with a single unseal key. The root token is already authenticated to the CLI, so you can immediately begin using Vault.

Execute the following command to start Vault in development mode:

```
vault server -dev -dev-root-token-id="root"
```{{execute}}

This is a built-in, pre-configured server that is ***not*** very secure but useful for playing with Vault locally.

Scroll up to find the following message:

```
You may need to set the following environment variable:

    $ export VAULT_ADDR='http://127.0.0.1:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: zA1ujDttNWW9REd5I+VHCcYnmYiZHmBDs2QxZCVDgZc=
Root Token: root
```

**CTRL + C** to terminate the dev server.  Next, you are going to learn how to configure Vault.
