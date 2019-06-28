In this scenario, you are going to configure PostgreSQL secret engine, and create a static read-only database role with username, "vault-edu". The Vault generated PostgreSQL credentials will only have read permission.

<img src="https://education-yh.s3-us-west-1.amazonaws.com/katacoda-images/vault-db-rotate-1.png">


## Create a new database user

Let's connect to the `postgres` container:

```
docker exec -it postgres bash
```{{execute T2}}

Connect to the `psql` as a root user:

```
export PGPASSWORD='rootpassword'; psql -U root -d postgres
```{{execute T2}}

Create a new database user, "vault-edu" with password, "mypassword":

```
CREATE ROLE "vault-edu" WITH LOGIN PASSWORD 'mypassword';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "vault-edu";
\du
\q
```{{execute T2}}


## Enable and configure database secrets engine

Open another terminal and execute the following command to enable the database secrets engine at `database/` path.

```
export VAULT_ADDR='http://127.0.0.1:8200'
vault secrets enable database
```{{execute T3}}

This guide assumes that you enabled the database secrets engine at `database`. If you enabled it at a different path, be sure to use the correct path as you follow this guide.

Execute the following command to configure the database secret engine which uses `postgresql-database-plugin`.

```
vault write database/config/postgresql plugin_name=postgresql-database-plugin \
       allowed_roles="*" \
       connection_url=postgresql://{{username}}:{{password}}@localhost:5432/postgres?sslmode=disable \
       username="root" password="rootpassword"
```{{execute T3}}

Execute the following command to rotate the root credentials:

```
vault write -force database/rotate-root/postgresql
```{{execute T3}}

**NOTE:** As a best practice, this example is using the **templated credentials** and rotate its root password immediately since the initial password was `rootpassword` which is too simple. For more details, refer to the [Database Root Credential Rotation](https://learn.hashicorp.com/vault/secrets-management/db-root-rotation) guide.
