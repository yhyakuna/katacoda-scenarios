## Start and Login to Vault

When Vault is running in development mode, it runs entirely in-memory and starts unsealed with a single unseal key. The root token is already authenticated to the CLI, so you can immediately begin using Vault.

First, set the `VAULT_ADDR` environment variable.

> Enter the following command into the terminal, or click on the command (`⮐`) to automatically copy it into the terminal and execute it.

```
export VAULT_ADDR=http://127.0.0.1:8200
```{{execute}}

Start the server in development mode:

```
vault server -dev -dev-root-token-id="root"
```{{execute}}

Now, log into Vault using the root token:

```
vault login root
```{{execute}}

<br>

#### Now, you are ready to start writing Vault policies!
