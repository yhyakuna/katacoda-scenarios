Consul Template has been installed. Execute the following command to check the version:

```
consul-template -v
```{{execute T2}}

Enter the following in the `customer-v1.tpl`{{open}} file:

<pre class="file" data-filename="customer-v1.tpl" data-target="replace">
{{ with secret "secret/customers/acme?version=1" }}
Organization: {{ .Data.data.organization }}
Contact: {{ .Data.data.contact_email }}
{{ end }}
</pre>





Enter the following in the `customer-v2.tpl`{{open}} file:

<pre class="file" data-filename="customer-v2.tpl" data-target="replace">
{{ with secret "secret/data/customers/acme?version=1" }}
Organization: {{ .Data.data.organization }}
Contact: {{ .Data.data.contact_email }}
{{ end }}
</pre>
