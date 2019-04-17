**!!! BEFORE RESUME !!!**

Return to the **Terminal 2** and press **Ctl + C** to stop the running Vault Agent.  We are going to modify the agent configuration to support Caching.



## Vault Agent Configuration

To enable Vault Agent Caching, the agent configuration file must define `cache` and `listener` stanzas. The `listener` stanza specifies the proxy address which Vault Agent listens. All the requests will be made through this address and forwarded to the Vault server.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/screenshots/vault-agent-caching.png">

Examine the Vault Agent configuration file, `agent-config-caching.hcl`{{open}}.

```
exit_after_auth = false
pid_file = "./pidfile"

auto_auth {
   method "approle" {
       mount_path = "auth/approle"
       config = {
           role_id_file_path = "roleID"
           secret_id_file_path = "secretID"
           remove_secret_id_file_after_reading = false
       }
   }

   sink "file" {
       config = {
           path = "approleToken"
       }
   }
}

cache {
   use_auto_auth_token = true
}

listener "tcp" {
   address = "127.0.0.1:8007"
   tls_disable = true
}

vault {
   address = "http://127.0.0.1:8200"
}
```

In this example, the agent listens to port **8007**.

Execute the following command to start the Vault Agent with `debug` logs.

```
vault agent -config=agent-config.hcl -log-level=debug
```{{execute T2}}
