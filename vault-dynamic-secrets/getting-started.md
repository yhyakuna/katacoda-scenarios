[Vault docker container](https://hub.docker.com/r/_/vault/) is running in development mode.

## Login to Vault

When Vault is running in development mode, it runs entirely in-memory and starts unsealed with a single unseal key. The root token is already authenticated to the CLI, so you can immediately begin using Vault.

First, get the generated root token by executing the following command:

```
docker logs vault > system.out
grep 'Root Token:' system.out | awk '{print $NF}' > root_token.txt
```{{execute}}

Login with root token:

```
vault login $(cat root_token.txt)
```{{execute}}

Now, you are logged in as a `root` and ready to play!


```
docker exec -it postgres psql -U postgres -c 'CREATE DATABASE myapp;' &>/dev/null
```{{execute}}




```
vault write database/config/postgresql \
   plugin_name=postgresql-database-plugin \
   allowed_roles="*" \
   connection_url="postgresql://postgres:training@0.0.0.0:5432/myapp?sslmode=disable"
```{{execute}}


```
vault write database/config/postgresql \
  plugin_name=postgresql-database-plugin \
  allowed_roles="*" \
  connection_url="jdbc:postgres://postgres:training@localhost:5432/myapp"
```{{execute}}
