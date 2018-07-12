Once the `transit` secrets engine has been configured, any client with valid token with proper permission can send data to encrypt.

Execute the following command to encrypt a plaintext using the `transit/encrypt` endpoint:

```
vault write transit/encrypt/orders plaintext=$(base64 <<< "credit-card-number")
```{{execute T2}}

> **NOTE:** All plaintext data must be base64-encoded.
