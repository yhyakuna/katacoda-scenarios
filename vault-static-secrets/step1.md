First, check the current version of the key/value secret engine that is ready to use.  Run the following command:

```
vault secrets list -format=json
```{{execute}}

In the output, locate "secret/" and check its version.

```
  "secret/": {
    "type": "kv",
    "description": "key/value secret storage",
    "accessor": "kv_2f454d26",
    "config": {
      "default_lease_ttl": 0,
      "max_lease_ttl": 0,
      "force_no_cache": false
    },
    "options": {
      "version": "2"
    },
    "local": false,
    "seal_wrap": false
  },
```

When you run Vault in development mode, the [key/value version 2](https://www.vaultproject.io/docs/secrets/kv/kv-v2.html) gets enabled by default.  If you are running your vault in non-dev mode, key/value version 1 gets enabled.

Execute the following command to read secrets at `secret/training` path:

```
vault kv get secret/training
```{{execute}}

Expected output: `No value found at secret/training"`



### Get Help

Run the following command to view the full list of optional parameters `vault kv` operation:

```
vault kv -h
```{{execute}}
