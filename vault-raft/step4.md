Let's enable K/V secrets engine and create some test data.

```
vault secrets enable -path=secret kv-v2
vault kv put secret/credentials user_id="student" passcode="vaultrocks"
```{{execute T2}}

Try to read the data from `node2`.

```
vault kv get secret/credentials
```{{execute T4}}
