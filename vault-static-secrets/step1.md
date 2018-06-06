First, check the current version of the key/value secret engine that is ready to use.  Run the following command:

```
vault secrets list -detailed
```{{execute}}

In the output, locate "secret/" and check its version.

```
Path          Type         Accessor              ...    Options           Description
----          ----         --------              ...    -------           -----------
cubbyhole/    cubbyhole    cubbyhole_1cca99e9    ...    map[]             per-token private secret storage
identity/     identity     identity_67a39d3a     ...    map[]             identity store
secret/       kv           kv_84d9897b           ...    map[version:2]    key/value secret storage
sys/          system       system_4b427358       ...    map[]             system endpoints used for control, policy and debugging
```

Under **Options**, it should display that the kv version is 2.  

> When you run Vault in development mode, the [key/value version 2](https://www.vaultproject.io/docs/secrets/kv/kv-v2.html) gets enabled by default.  If you are running your vault in non-dev mode, key/value version 1 gets enabled.

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
