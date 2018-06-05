Log into Vault using the initial root token:

```
vault login $(grep 'Initial Root Token:' key.txt | awk '{print $NF}')
```{{execute T2}}

Enable audit logging:

```
vault audit enable file file_path=/var/log/vault-audit.log
```{{execute T2}}

`/var/log/vault-audit.log`{{open}}
