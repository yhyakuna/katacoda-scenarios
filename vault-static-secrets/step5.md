Get help on the delete command:

```
vault kv delete -h
```{{execute}}

This command deletes secrets and configuration from Vault at the given path.

Let's delete `secret/company`:

```
vault kv delete secret/company
```{{execute}}

Try reading the `secret/company` path again. The output displays the metadata only with `deletion_time`.


## Restore the Deleted Secrets

Key/value secret engine v2 allows you to recover from unintentional data loss or overwrite when more than one user is writing at the same path.

Run the following command to recover the deleted data:

```
vault kv undelete -versions=1 secret/company
```{{execute}}
