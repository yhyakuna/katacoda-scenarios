## Generate Client Token

Consul Template tool itself is a Vault client. Therefore it must have a valid token with policies permitting it to retrieve secrets from KV secrets engine. So, first, you need to create a policy allowing Consul Template to read from `kv-v1` and `kv-v2` paths.

Policy file has been provided: `readonly.hcl`{{open}}

Create a policy named, `readonly`:

```
vault policy write readonly readonly.hcl
```{{execute T2}}

Now, execute the following command to generate a client token for Consul Template to use and save the generated token in `token.txt` file:

```
vault token create -policy=readonly -ttl=1h \
      -format=json | jq -r ".auth.client_token" > token.txt
```{{execute T2}}

This token is valid for 1 hour, and `readonly` policy is attached.

```
vault token lookup $(cat token.txt)
```{{execute T2}}



## Write Template Files

Assume that your application needs to retrieve a portion of the customer data from KV secrets engine, and generate a file output as follow:

```
Organization: <_organization-name_>
ID: <_customer-id_>
Contact: <_contact-email_>
```

To have Consul Template to populate those values, you need to create a **template file** with Consul Template [templating language](https://github.com/hashicorp/consul-template#templating-language).

You need to create a template file using Consul Template syntax so that the values will be retrieved from Vault. Enter the following in the `customer-v1.tpl`{{open}} file:

<pre class="file" data-filename="customer-v1.tpl" data-target="replace">
{{ with secret "secret/customers/acme" }}
Organization: {{ .Data.organization }}
ID: {{ .Data.customer_id }}
Contact: {{ .Data.contact_email }}
{{ end }}
</pre>

This template file will be used to retrieve data from `kv-v1`.

Now, enter the following in the `customer-v2.tpl`{{open}} file:

<pre class="file" data-filename="customer-v2.tpl" data-target="replace">
{{ with secret "secret/data/customers/acme?version=1" }}
Organization: {{ .Data.data.organization }}
ID: {{ .Data.data.customer_id }}
Contact: {{ .Data.data.contact_email }}
{{ end }}
</pre>

> Notice the difference. In `customer-v2.tpl`, you need to specify the version of the secrets you wish to retrieve (`secret/data/customers/acme?version=1`).  Also, the path contains `data`. This is because the API endpoint to interact with KV version 1 and version 2 are slightly different. Read the [KV v2 documentation](https://www.vaultproject.io/api/secret/kv/kv-v2.html#read-secret-version) for more detail.



## Run Consul Template

Consul Template has been installed. Execute the following command to check the version:

```
consul-template -v
```{{execute T2}}

Let's run Consul Template against `kv-v1`:

```
VAULT_TOKEN=$(cat token.txt) consul-template -template=customer-v1.tpl:customer-v1.txt -once
```{{execute T2}}

Verify that the secrets were retrieved successfully: `customer-v1.txt`{{open}}



Now, run Consul Template against `kv-v2`:

```
VAULT_TOKEN=$(cat token.txt) consul-template -template=customer-v2.tpl:customer-v2.txt -once
```{{execute T2}}

Verify that the secrets were retrieved successfully: `customer-v2.txt`{{open}}
