Execute the following command to enable the `transit` secrets engine and create a key.

```
export VAULT_ADDR="http://127.0.0.1:8200"
vault secrets enable transit
```{{execute T2}}

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
