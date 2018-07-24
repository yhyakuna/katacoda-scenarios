First, the `pki` secrets engine must be enabled before it can operate. Execute the following command to enable the `pki` secrets engine at `pki_app`:

```
vault secrets enable -path=pki_app pki
```{{execute T2}}


To generate a new private key and a CSR for signing, invoke the `pki/intermediate/generate/<type>` API endpoint.  Since we set the mount path of the `pki` secrets engine to be `pki_app`, the endpoint is `pki_app/intermediate/generate/<type>`.

The `<type>` can be one of the following:

- **`exported`** - the private key will be returned
- **`internal`** - the private key will not be returned and cannot be retrieved later


Execute the following command to configure a CA certificate and private key:

```
vault write pki_app/intermediate/generate/internal \
      common_name="Example Vault App CA" \
       ttl=384h
```{{execute T2}}

The command set the CN to be "Example Vault App CA" and the time to live (TTL) to be 384 hours.

> **NOTE:** The returned certificate is purely informative, and the private key is stored internally within Vault.

To update the CRL location and issuing certificate:  

```
vault write <pki_mount_path>/config/urls \
      issuing_certificates=$VAULT_ADDR/v1/<pki_mount_path>/ca \
      crl_distribution_points=$VAULT_ADDR/v1/<pki_mount_path>/crl
```

Execute the following command to update the CRL location and issuing certificates:

```
vault write pki_app/config/urls \
      issuing_certificates="http://127.0.0.1:8200/v1/pki_app/ca" \
      crl_distribution_points="http://127.0.0.1:8200/v1/pki_app/crl"
```{{execute T2}}


Execute the following command to configure a role that maps to a name in Vault for generating a certificate:

```
vault write pki_app/roles/app-server \
  allowed_domains="app.nyc.example.com" \
  allow_subdomains=true \
  max_ttl=384h \
  generate_lease=true
```{{execute T2}}
