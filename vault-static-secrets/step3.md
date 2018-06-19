View the contents of the file named, `data.txt`:   

```
clear
cat data.txt
```{{execute T2}}

Copy this file onto the vault container:

```
docker cp data.txt vault:/data.txt
```{{execute T2}}

Now, let's store the data written in `data.txt` to Vault at `secret/company` path:


```
vault kv put secret/company @data.txt
```{{execute T2}}

> Any value begins with "@" is loaded from a file.

Read the secret in the `secret/company` path:

```
vault kv get secret/company
```{{execute T2}}
