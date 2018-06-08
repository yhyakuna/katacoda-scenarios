In order for the apps to acquire a valid token to read secrets from `secret/data/dev` path, it must run the unwrap operation using this token.

Use `vault unwrap` command to retrieve the wrapped secrets as follow:

```
vault unwrap <wrapping_token>
```
or
```
VAULT_TOKEN=<wrapping_token> vault unwrap
```
or
```
vault login <wrapping_token>
vault unwrap
```

<br>

Let's unwrap the secret which contains the client token with `apps`. The following command stores the resulting token in `client-token.txt`.

```
vault unwrap -format=json $(cat wrapping-token.txt) \
    | jq -r ".auth.client_token" > client-token.txt
```{{execute}}

Log into Vault using the token you just uncovered:

```
vault login $(cat client-token.txt)
```{{execute}}

<br>

Remember that `apps` policy has a very limited privilege that the policy does not grant permissions on the `secret/data/dev` path other than **read**. Run the following command to verify that you can read the data at `secret/dev`:

```
vault kv get secret/dev
```{{execute}}

<br>

If you have credentials stored in Vault and wish to distribute it to a trusted entity (user or app) securely, you can use response wrapping.

Login with root token again:

```
vault login $(cat root_token.txt)
```{{execute}}

Write some secrets:

```
vault kv put secret/app_credential id="project-admin" password="my-long-password"
```{{execute}}

Without response wrapping:

```
vault kv get secret/app_credential
```{{execute}}

When you wrap the response, even you don't see the data:

```
vault kv get -wrap-ttl=60 secret/app_credential

Key                              Value
---                              -----
wrapping_token:                  fc76f5e8-f8c4-be9a-50fb-39e5c79676b7
wrapping_accessor:               e39c07b7-71bd-4946-87b3-86302538ac48
wrapping_token_ttl:              1m
wrapping_token_creation_time:    2018-06-08 00:47:43.915339533 +0000 UTC
wrapping_token_creation_path:    secret/data/app_credential
```

The response from the `vault kv get secret/app_credential` operation is now placed into the cubbyhole tied to the `wrapping_token` and can be revealed only by the `wrapping_token`.

```
vault kv get -format=json -wrap-ttl=60 secret/app_credential \
     | jq -r ".wrap_info.token" > wrapping-token.txt
```{{execute}}

```
vault unwrap -format=json $(cat wrapping-token.txt) 
```{{execute}}
