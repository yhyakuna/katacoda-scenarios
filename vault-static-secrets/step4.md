Get help on the list command:

```
vault kv list -h
```{{execute T2}}

This command can be used to list keys in a given secret engine.


Run the following command to list all the secret keys stored in the key/value secret backend.

```
clear
vault kv list secret
```{{execute T2}}

The output displays only the keys and not the values.

This indicates that there is `secret/training` and `secret/company` under the `secret/` path.
