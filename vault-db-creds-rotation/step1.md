In this scenario, you are going to configure PostgreSQL secret engine, and create a static read-only database role with username, "vault-edu". The Vault generated PostgreSQL credentials will only have read permission.

<img src="https://education-yh.s3-us-west-1.amazonaws.com/katacoda-images/vault-db-rotate-1.png">


## Create a new database user

Let's connect to the `postgres` container:

```
docker exec -it postgres bash
```{{execute T2}}

Start the `psql` as a root user:

```
psql -U root -password rootpassword
```{{execute T2}}



```
CREATE ROLE "vault-edu" WITH LOGIN PASSWORD 'mypassword';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "vault-edu";
```{{execute T2}}

Execute the following command to create a role named, "apps" with `token_update` policy attached.

```
vault write auth/approle/role/apps policies="token_update"
```{{execute T2}}
