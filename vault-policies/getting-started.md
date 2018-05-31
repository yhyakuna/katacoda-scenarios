Vault docker container is running in development mode.

## Login to Vault

When Vault is running in development mode, it runs entirely in-memory and starts unsealed with a single unseal key. The root token is already authenticated to the CLI, so you can immediately begin using Vault.

First, get the generated root token by executing the following command:

```
docker logs vault > root_token.txt
grep 'Root Token:' root-token.txt | awk '{print $NF}' > root_token.txt
```{{execute}}

Login with root token:

```
vault login $(cat root_token.txt)
```{{execute}}
