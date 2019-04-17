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

Now, generate a role ID and stores it in a file named, "roleID".  Also, generate a secret ID and stores it in the "secretID" file.

```
vault read -format=json auth/approle/role/apps/role-id | jq  -r '.data.role_id' > roleID
vault write -f -format=json auth/approle/role/apps/secret-id | jq -r '.data.secret_id' > secretID
```{{execute T2}}





The `approle` auth method allows machines or apps to authenticate with Vault using Vault-defined roles. The **role ID** is equivalent to username, and the **secret ID** is equivalent to a password.

Refer to the _AppRole Pull Authentication_ guide ([https://learn.hashicorp.com/vault/identity-access-management/iam-authentication](https://learn.hashicorp.com/vault/identity-access-management/iam-authentication)) as well as _AppRole with Terraform & Chef_ guide ([https://learn.hashicorp.com/vault/identity-access-management/iam-approle-trusted-entities](https://learn.hashicorp.com/vault/identity-access-management/iam-approle-trusted-entities)) to learn more.

### Step 7.1.2
Execute the `setup-approle.sh` script.

```plaintext
$ ./setup-approle.sh
```

### Step 7.1.3
Examine the Vault Agent configuration file, `/workstation/vault102/agent-config.hcl`.

```plaintext
$ cat agent-config.hcl

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
           path = "/workstation/vault102/approleToken"
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

The `auto_auth` block points to the `approle` auth method which `setup-approle.sh` script configured. The acquired token gets stored in `/workstation/vault102/approleToken` (this is the sink location).

The `cache` block specifies the agent to listen to port **`8007`**.

### Step 7.1.4

> **NOTE:** If you want to run Vault Agent against your neighbor's Vault server instead, edit the `vault` block so that it points to the correct Vault server address. Needless to say, your neighbor has to provide you the **roleID** and **secretID** to successfully authenticate.

Execute the following command to start the Vault Agent with `debug` logs.

```plaintext
$ vault agent -config=agent-config.hcl -log-level=debug

==> Vault server started! Log data will stream in below:

==> Vault agent configuration:

           Api Address 1: http://127.0.0.1:8007
                     Cgo: disabled
               Log Level: debug
                 Version: Vault v1.1.0
             Version Sha: 36aa8c8dd1936e10ebd7a4c1d412ae0e6f7900bd
...
```


















```
vault auth enable userpass
```{{execute T2}}

Next, create a new policy named, `base`:

```
vault policy write base base.hcl
```{{execute T2}}

To review the created policy:

```
vault policy read base
```{{execute T2}}

This policy grants CRUD operations on the path starting with `secret/training`.

<br>
Let's create two more policies: `test` and `team-qa`.

Execute the following command to create `test` policy.

```
vault policy write test test.hcl
```{{execute T2}}


Execute the following command to create `team-qa` policy.

```
vault policy write team-qa team-qa.hcl
```{{execute T2}}


At this point, you should have `base`, `test`, and `team-qa` policies:

```
vault policy list
```{{execute T2}}

<br>

## Create Users

Create a new user in userpass backend:

- **username:** bob
- **password:** training
- **policy:** test

```
vault write auth/userpass/users/bob password="training" \
    policies="test"
```{{execute T2}}


Create another user in userpass backend:

- **username:** bsmith
- **password:** training
- **policy:** team-qa

```
vault write auth/userpass/users/bsmith password="training" \
      policies="team-qa"
```{{execute T2}}
