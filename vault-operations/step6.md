A recommended best practice is not to persist your root tokens. The root tokens should be used only for just enough initial setup or in emergencies. Once appropriate policies are written, use tokens with assigned set of policies based on your role in the organization.

Therefore, a root token should be generated using Vault's operator generate-root command only when absolutely necessary.

Review the help text on the `generate-root` operation:

```
vault operator generate-root -h
```{{execute T2}}

`clear`{{execute T2}}


First, execute the following command to generate a one-time password (OTP) and save it in the `otp.txt` file:

```
vault operator generate-root -generate-otp > otp.txt
```{{execute T2}}

Initialize a root token generation with the OTP code (`otp.txt`{{open}}) and save the resulting nonce in the `nonce.txt` file:

```
vault operator generate-root -init -otp=$(cat otp.txt) \
    -format=json | jq -r ".nonce" > nonce.txt
```{{execute T2}}

> The **nonce** value (`nonce.txt`{{open}}) should be distributed to all unseal key holders. Generation of a root token requires a quorum of unseal keys.


**Each unseal key holder** must execute the following command providing their unseal key:

```
vault operator generate-root -nonce=$(cat nonce.txt) \
    $(grep 'Key 1:' key.txt | awk '{print $NF}')
```{{execute T2}}

The output displays the progress:

```
Nonce       f5368918-60c0-5122-77b5-38c5aca3375d
Started     true
Progress    1/3
Complete    false
```

Proceed with second unseal key:

```
vault operator generate-root -nonce=$(cat nonce.txt) \
    $(grep 'Key 2:' key.txt | awk '{print $NF}')
```{{execute T2}}

Finally, enter the third unseal key and save the resulting encoded root token in the `encoded_root.txt` file:

```
vault operator generate-root -nonce=$(cat nonce.txt) \
    -format=json $(grep 'Key 3:' key.txt | awk '{print $NF}') \
    | jq -r ".encoded_root_token" > encoded_root.txt
```{{execute T2}}

The resulting root token is encrypted (`encoded_root.txt`{{open}}). Execute the following command to decode:

```
vault operator generate-root -decode=$(cat encoded_root.txt) -otp=$(cat otp.txt) \
    > root_token.txt
```{{execute T2}}

Now, verify the newly generated root token (`root_token.txt`{{open}}):

```
vault login $(cat root_token.txt)
```{{execute T2}}

The output should show that the token policy is **root**.


`clear`{{execute T2}}
