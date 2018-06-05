Outside of development mode, Vault servers are configured using a file. The format of this file is [HCL](https://github.com/hashicorp/hcl) or JSON. The configuration file for Vault is relatively simple.

Enter the following in the `config.hcl`{{open}} file:

<pre class="file" data-filename="config.hcl" data-target="replace">
# Use the file backend
storage "file" {
  path = "/data/vault"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}

ui = true
</pre>
