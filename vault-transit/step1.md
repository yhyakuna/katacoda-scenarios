The `transit` secrets engine must be configured before it can perform its operations.  These steps are usually done by an **operator** or configuration management tool.

First, enable the `transit` secret engine by executing the following command:

```
vault secrets enable transit
```{{execute T2}}

By default, the secrets engine will mount at the name of the engine.  If you wish to enable it at a different path, use the `-path` argument.

**Example:** `vault secrets enable -path=encryption transit`

Run the following command to verify that the `transit` secrets engine has been enabled at `transit`:

```
vault secrets list
```{{execute T2}}

Now, create an encryption key ring named, "orders" by executing the following command:

```
vault write -f transit/keys/orders
```{{execute T2}}

> **NOTE:** Typically, you want to create an encryption key ring for each application.

Now, the `transit` secrets engine is ready to use!