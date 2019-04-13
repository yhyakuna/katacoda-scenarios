Click the **+** next to the opened Terminal, and select **Open New Terminal**.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/ops-another-terminal.png" alt="New Terminal"/>


Execute the following command to create a server configuration file for **Vault 2**.

```
tee config-vault-2.hcl <<"EOF"
  disable_mlock = true
  ui=true

  storage "file" {
    path = "/vault-2/data"
  }

  listener "tcp" {
    address     = "0.0.0.0:8100"
    tls_disable = 1
  }

  seal "transit" {
    address = "http://127.0.0.1:8200"
    token = "$(cat client_token.txt)"
    disable_renewal = "false"
    key_name = "autounseal"
    mount_path = "transit/"
    tls_skip_verify = "true"
  }
EOF
```{{execute T2}}

Notice that the storage backend is set to `/vault-2/data`, and the **Vault 2** will be listening to port **8100**:
