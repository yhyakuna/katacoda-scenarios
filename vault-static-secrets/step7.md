Let's learn how to write, read, and delete secrets in key/value secret engine via API.


The API endpoint to interact with key/value secret engine v2 is `/v1/secret/data/<path>`.  The cURL command to write secrets would look like:

```
curl --header "X-Vault-Token: <token>" --request POST \
       --data <data>
       <VAULT_ADDRESS>/v1/secret/data/<path>
```

Where `<token>` is the valid Vault token.

Refer to the online API documentation ([https://www.vaultproject.io/api/secret/kv/kv-v2.html](https://www.vaultproject.io/api/secret/kv/kv-v2.html)) for more detail.

## Write Secrets via API

Execute the following cURL command to write data in `secret/apikey/google` path:

```
curl --header "X-Vault-Token: root" --request POST \
     --data '{"data": {"apikey": "1234ABC567DEF"} }'
     $VAULT_ADDR/v1/secret/data/apikey/google
```{{execute}}


## Read Secrets via API

```
curl --header "X-Vault-Token: root"  \
      $VAULT_ADDR/v1/secret/data/apikey/google | jq
```{{execute}}

In this exercise, parsing the output using jq tool just for the readability of the JSON response message.


## Retrieve the Keys via API

```
curl --header "X-Vault-Token: root" \
     --request GET \
     $VAULT_ADDR/v1/secret/apikey/google | jq ".data.data.apikey"
```{{execute}}


## Delete Secrets via API

**Hint:** Refer to the API documentation ([https://www.vaultproject.io/api/secret/kv/index.html#delete-secret](https://www.vaultproject.io/api/secret/kv/index.html#delete-secret)).
