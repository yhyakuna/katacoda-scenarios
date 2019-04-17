Return to the **Terminal 2** and press **Ctl + C** to stop the running Vault Agent.  We are going to modify the agent configuration to support Caching.

First, enable database secrets engine.

```
vault secrets enable database
```{{execute T2}}


Execute the following command to configure the database secrets engine.

```
vault write database/config/mysql \
      plugin_name=mysql-database-plugin \
      connection_url="root:root@tcp(127.0.0.1:3306)/" \
      allowed_roles="readonly"
```{{execute T2}}

# Create MySQL readonly role

```
vault write database/roles/readonly \
      db_name=mysql \
      creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';" \
      default_ttl="30m" \
      max_ttl="24h"
```{{execute T2}}

<br>

## Vault Agent Configuration

Examine the Vault Agent configuration file, `agent-config-caching.hcl`{{open}}.

```
exit_after_auth = false
pid_file = "./pidfile"

auto_auth {
   method "approle" {
       mount_path = "auth/approle"
       config = {
           role_id_file_path = "roleID"
           secret_id_file_path = "secretID"
           remove_secret_id_file_after_reading = false
       }
   }

   sink "file" {
       config = {
           path = "approleToken"
       }
   }
}

cache {
   use_auto_auth_token = true
}

listener "tcp" {
   address = "127.0.0.1:8007"
   tls_disable = true
}

vault {
   address = "http://127.0.0.1:8200"
}
```





```
docker exec -it mysql-demo mysql -uroot -proot
```{{execute T2}}
