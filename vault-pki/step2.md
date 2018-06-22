Configure URLs for Vault CA and CRL Access

```
vault write rootpki/config/urls \
issuing_certificates="http://10.1.42.101:8200/v1/rootpki"
```{{execute}}


```
vault write intpki/config/urls \
issuing_certificates="http://10.1.42.101:8200/v1/intpki/ca" \
crl_distribution_points="http://10.1.42.101:8200/v1/intpki/crl"
```{{execute}}


## Create a Role

The final step is to create a role to define the attributes associated with the generated certificates. This includes attributes such as certificate type, key type, and so on.

This example www role defines 2048 bit keys and 1 year TTLs for only subdomains of `example.com`:

```
vault write intpki/roles/www key_bits=2048 max_ttl=8760h allowed_domains=example.com allow_subdomains=true
```{{execute}}

Provided everything was successful, you're now ready to request a certificate from the Intermediate CA!

```
vault write intpki/issue/www common_name="tacos.example.com" ip_sans="10.1.74.100" ttl=1080h format=pem
```{{execute}}

## Revoke a Certificate

```
export CERT_SERIAL=<certserial>
```{{execute}}

```
curl -v -X POST $VAULT_ADDR/v1/pki/revoke \
  -H "X-Vault-Token: $VAULT_TOKEN" \
  -d '{"serial_number":"'$CERT_SERIAL'"}'
```{{execute}}

## Test the CRL

```
curl -v $VAULT_ADDR/v1/pki/crl/pem > vault_crl.pem openssl crl -inform PEM -in vault_crl.pem -text
```{{execute}}

The output from above should contain the serial number of the revoked certificate.
