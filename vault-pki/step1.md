This section details setting up Vault PKI with a self-generated root CA, and an intermediate CA for normal signing. It demonstrates the API calls that do the following:

- Configure a root backend
- Configure an intermediate backend
- Create a CSR from the intermediate backend
- Sign the CSR with root backend
- Set back to the intermediate backend for signing new certificates


```
vault mount -path=rootpki -description="Example Root CA" -max-lease-ttl=175200h pki
```{{execute}}



```
vault write rootpki/root/generate/exported common_name="example.com" ttl=175200h
```{{execute}}


```
vault write rootpki/root/generate/internal common_name="example.com" ttl=175200h
```{{execute}}


Configure URLs for Vault CA and CRL Access:

```
vault write rootpki/config/urls issuing_certificates="http://10.1.42.101:8200/v1/rootpki"
```{{execute}}

Create Intermediate CA, CA Certificate & CA Key:

```
vault mount -path=intpki -description="Example Dot Com Intermediate CA" -max-lease-ttl=17520h pki
```{{execute}}


## Create Intermediate CSR

The outputted certificate request as `example_dot_com.csr` for the next step.

```
vault write intpki/intermediate/generate/internal common_name="Example Intermediate CA" \
      ttl=17520h key_bits=4096 exclude_cn_from_sans=true
```{{execute}}



## Sign CSR with Root CA
Save the Root CA signed certificate (the value of certificate) as `example_dot_com.crt` so that it can be imported into the Intermediate CA backend.

```
vault write rootpki/root/sign-intermediate csr=@example_dot_com.csr common_name="Example Intermediate CA" ttl=8760h
```{{execute}}

## Import Signed Certificate into Intermediate CA

```
vault write intpki/intermediate/set-signed certificate=@example_dot_com.crt
```{{execute}}

NOTE: If you want the full CA chain output, you should upload the root certificate along with the signed intermediate CA cert when you use set-signed.
