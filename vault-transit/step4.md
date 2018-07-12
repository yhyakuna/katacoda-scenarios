Let's encrypt another data and save its ciphertext in `cipher2.txt`:

```
vault write -format=json transit/encrypt/orders \
      plaintext=$(base64 <<< "visa-card-number") \
      | jq -r ".data.ciphertext" > cipher2.txt
```{{execute T2}}

Compare the ciphertexts:

```
cat cipher.txt
cat cipher2.txt
```{{execute T2}}
