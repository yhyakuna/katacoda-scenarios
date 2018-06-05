
```
docker exec -it postgres psql -U postgres -c 'CREATE DATABASE myapp;' &>/dev/null
```{{execute}}

```
vault secrets enable database
```{{execute}}


```
vault write database/config/postgresql \
   plugin_name=postgresql-database-plugin \
   allowed_roles="*" \
   connection_url="postgresql://postgres:training@localhost:5432/myapp?sslmode=disable"
```{{execute}}




vault write database/config/postgresql \
   plugin_name=postgresql-database-plugin \
   allowed_roles="*" \
   connection_url="postgresql://postgres:postgres@localhost:5432/myapp?sslmode=disable"
