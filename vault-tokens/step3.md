Execute the following command to create a token with use limit of 2, and save the generated token in a file named, `use_limit_token.txt`.

```
vault token create -use-limit=2-policy=base -format=json | jq -r ".auth.client_token" > use_limit_token.txt
```{{execute}}

Now, test the token with use limit by executing some vault commands:

```
VAULT_TOKEN=$(cat use_limit_token.txt) vault token lookup
```{{execute}}

Execute the following command to write some secrets at `secret/training_test`:

```
VAULT_TOKEN=$(cat use_limit_token.txt) vault kv put secret/training_test year="2018"
```{{execute}}

The command should execute successfully.

Now, try to read the data that you just wrote.

```
VAULT_TOKEN=$(cat use_limit_token.txt) vault kv get secret/training_test
```{{execute}}

This fails since the use limit was reached. Once the use limit was reached, the token gets revoked automatically.
