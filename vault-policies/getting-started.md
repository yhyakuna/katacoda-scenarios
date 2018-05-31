Vault has been installed and started in development mode (`-dev`).

Scroll in the terminal to locate the output similar to the following:

```
WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
and starts unsealed with a single unseal key. The root token is already
authenticated to the CLI, so you can immediately begin using Vault.

You may need to set the following environment variable:

    $ export VAULT_ADDR='http://127.0.0.1:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: V9VNbbzcZ2WQekC3PQiXmJBXJhkrt/7byQXNFKAKq/k=
Root Token: root

Development mode should NOT be used in production installations!
```

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
