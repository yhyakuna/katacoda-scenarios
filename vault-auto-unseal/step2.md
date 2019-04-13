To enable **Transit Auto-Unseal**, you would need **two** Vault servers. Two options are provided to perform this lab. **Choose one** of the following options and perform the tasks as instructed.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/screenshots/3-autounseal-2.png">


Review the server configuration file for **Vault 1**: `config-vault-1.hcl`{{open}}

```
disable_mlock = true
ui=true

storage "file" {
  path = "/vault-1/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}
```

For the purpose of demonstration, the **file** storage backend stores Vault's data on the filesystem using a standard directory structure (`/vault-1/data`) in this example.

The `listener` stanza specifies the TCP address/port that Vault listens to for incoming requests, and **Vault 1** listens to port **8200**.

Execute the following command to start the **Vault 1** server:

```
vault server -config=config-vault-1.hcl
```{{execute T1}}

Notice the output indicating that the **Storage** is set to `file` system, and the **Listener** address is `0.0.0.0:8200`.

```
==> Vault server configuration:

                     Cgo: disabled
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration:"1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: (not set)
                   Mlock: supported: true, enabled: true
                 Storage: file
                 Version: Vault v1.1.1
             Version Sha: c19cef14891751a23eaa9b41fd456d1f99e7e856
```

Next, you are going to initialize Vault.



## Configure Auto-unseal Key Provider (Vault 1)

Execute the following command to enable the `transit` secrets engine and create a key.

```
vault secrets enable transit
```{{execute T1}}

Create a key named 'autounseal'

```
vault write -f transit/keys/autounseal
```{{execute T1}}


Create `autounseal` policy defined by `autounseal.hcl`{{open}} policy file.

```
vault policy write autounseal autounseal.hcl
```{{execute T1}}

Create a new token with `autounseal` policy attached and save it in a file named, `client_token.txt`.

```
vault token create -role="autounseal" \
      -format=json | jq -r ".auth.client_token" > client_token.txt
```{{execute T1}}
