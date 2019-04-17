Vault Agent runs on the **client** side to automate leases and tokens lifecycle management.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/screenshots/vault-agent-auto-auth.png">

For this scenario, you are going to run the Vault Agent on the same machine as where the Vault server is running. However, the basic working is the same except the host machine address.

First, setup the auth method on the Vault server. In this example, you are going to enable [`approle`](https://www.vaultproject.io/docs/auth/approle.html) auth method.

```
vault auth enable approle
```{{execute T2}}

Create a policy named, "db_readonly" which is defined by the `db_readonly.hcl`{{open}} file.

```
vault policy write db_readonly db_readonly.hcl
```{{execute T2}}

Execute the following command to create a role named, "apps" with `db_readonly` policy attached.

```
vault write auth/approle/role/apps policies="db_readonly"
```{{execute T2}}

Now, generate a role ID and stores it in a file named, "roleID".

```
vault read -format=json auth/approle/role/apps/role-id \
        | jq  -r '.data.role_id' > roleID
```{{execute T2}}

The `approle` auth method allows machines or apps to authenticate with Vault using Vault-defined roles. The generated **roleID**{{open}} is equivalent to username.

Also, generate a secret ID and stores it in the "secretID" file.

```
vault write -f -format=json auth/approle/role/apps/secret-id \
        | jq -r '.data.secret_id' > secretID
```{{execute T2}}

The generated **secretID**{{open}} is equivalent to a password.

Refer to the [_AppRole Pull Authentication_](https://learn.hashicorp.com/vault/identity-access-management/iam-authentication) guide to learn more.

## Vault Agent Configuration

Examine the Vault Agent configuration file, `agent-config.hcl`{{open}}.

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
           path = "~/approleToken"
       }
   }
}

vault {
   address = "http://127.0.0.1:8200"
}
```

The `auto_auth` block points to the `approle` auth method, and the acquired token gets stored in `approleToken`{{open}} file which is the sink location.


Execute the following command to start the Vault Agent with `debug` logs.

```
$ vault agent -config=agent-config.hcl -log-level=debug

==> Vault server started! Log data will stream in below:

==> Vault agent configuration:

           Api Address 1: http://127.0.0.1:8007
                     Cgo: disabled
               Log Level: debug
                 Version: Vault v1.1.0
             Version Sha: 36aa8c8dd1936e10ebd7a4c1d412ae0e6f7900bd
...
```{{execute T2}}
