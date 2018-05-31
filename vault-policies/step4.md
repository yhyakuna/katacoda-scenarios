Recall that the `base` policy only permits CRUD operations on `secret/training/` path.  

The following command **should** fail with **"permission denied"** error.:

```
vault policy list
```{{execute}}

Similarly, you won't be able to write secrets at `secret/apikey`:

```
vault kv put secret/apikey key="my-api-key"
```{{execute}}

Finally, the following command should execute successfully:

```
vault kv put secret/training scenario_name="Vault Policy"
```{{execute}}

You should be able to read back the data:

```
vault kv get secret/training
```{{execute}}
