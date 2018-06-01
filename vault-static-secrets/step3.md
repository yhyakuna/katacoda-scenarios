View the contents of the file named, `data.txt`:   `cat data.txt`{{execute}}

Copy this file onto the vault container:

```
docker cp base.hcl vault:/base.hcl
```{{execute}}

Now, let's store the data written in `data.txt` to Vault at `secret/company` path:


```
vault kv put secret/company @data.txt
```{{execute}}

Read the secret in the `secret/company` path:

```
vault kv get secret/company
```{{execute}}
