
Execute the following command to create a server configuration file for **Vault 2**.

```
tee config-vault-2.hcl <<"EOF"
  disable_mlock = true
  ui=true

  storage "file" {
    path = "~/vault-2/data"
  }

  listener "tcp" {
    address     = "0.0.0.0:8100"
    tls_disable = 1
  }

  seal "transit" {
    address = "http://127.0.0.1:8200"
    disable_renewal = "false"
    key_name = "autounseal"
    mount_path = "transit/"
    tls_skip_verify = "true"
  }
EOF
```{{execute T2}}

Examine the configuration file: `config-vault-2.hcl`{{open}}

Notice that the storage backend is set to `/vault-2/data`, and the **Vault 2** will be listening to port **8100**.


Start the vault server with configuration file.

```
export VAULT_TOKEN="$(cat client_token.txt)"
vault server -config=config-vault-2.hcl
```{{execute T2}}

In the second terminal, initialize your second Vault server (**Vault 2**).

```
VAULT_ADDR=http://127.0.0.1:8100 vault operator init -recovery-shares=1 \
         -recovery-threshold=1 > recovery-key.txt
```{{execute T2}}

By passing the `VAULT_ADDR`, the subsequent command gets executed against the second Vault server (http://127.0.0.1:8100). Notice that you are setting the number of **recovery** key and **recovery** threshold because there is no unseal keys with auto-unseal. Vault 2's master key is now protected by the `transit` secret engine of **Vault 1**.

In the terminal where the server is running, you should see entries similar to:

```
...
[INFO]  core: security barrier not initialized
[INFO]  core: security barrier initialized: shares=1 threshold=1
[INFO]  core: post-unseal setup starting
...
[INFO]  core: vault is unsealed
[INFO]  core.cluster-listener: starting listener: listener_address=0.0.0.0:8101
...
```

Check the Vault 2 status.

```
VAULT_ADDR=http://127.0.0.1:8100 vault status

Key                      Value
---                      -----
Recovery Seal Type       shamir
Initialized              true
Sealed                   false
Total Recovery Shares    1
Threshold                1
...
```{{execute T2}}
