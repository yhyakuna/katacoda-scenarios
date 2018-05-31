Vault has been installed and started in development mode (`-dev`).

## Login to Vault

Click on the **+** next to the Terminal and select **Open New Terminal** from its pop-up menu.

In the new terminal, let's set the `VAULT_ADDR` environment variable:

```
export VAULT_ADDR=http://127.0.0.1:8200
```{{execute}}

Login with root token:

```
vault login root
```{{execute}}
