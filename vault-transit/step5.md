Execute the key rotation command a few times to generate multiple versions of the key:

```
vault write -f transit/keys/orders/rotate
vault write -f transit/keys/orders/rotate
vault write -f transit/keys/orders/rotate
vault write -f transit/keys/orders/rotate
```{{execute T2}}

Check the `orders` key information:

```
vault read transit/keys/orders
```{{execute T2}}

You can see that the current version of the key is six. There is no restriction about the minimum encryption key version, and any of the key versions can decrypt the data (min_decryption_version).

Run the following command to enforce the use of the encryption key at version five or later to decrypt the data.

```
vault write transit/keys/orders/config min_decryption_version=5
```{{execute T2}}

Now, verify the `orders` key configuration:

```
vault read transit/keys/orders
```{{execute T2}}
