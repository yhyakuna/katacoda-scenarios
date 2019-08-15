Click the **+** next to the opened Terminal, and select **Open New Terminal** to start third terminal.

Open the `node2` server configuration file, `config-node2.hcl`{{open}}.

```
storage "raft" {
  path    = "/home/scrapbook/tutorial/raft-node2/"
  node_id = "node2"
}

listener "tcp" {
  address = "127.0.0.1:2200"
  cluster_address = "127.0.0.1:2201"
  tls_disable = true
}

disable_mlock = true
api_addr = "http://127.0.0.1:2200"
cluster_addr = "http://127.0.0.1:2201"
```

Notice that the `node_id` is set to `node2` and this server will listen to port `2200`.

Execute the following command to start `node2`:

```
mkdir raft-node2
vault server -config=config-node2.hcl
```{{execute T3}}

```
==> Vault server configuration:

             Api Address: http://127.0.0.1:2200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:2201
              Listener 1: tcp (addr: "127.0.0.1:2200", cluster address: "127.0.0.1:2201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: info
                   Mlock: supported: true, enabled: false
                 Storage: raft (HA available)
                 Version: Vault v1.2.2

==> Vault server started! Log data will stream in below:
```

You can verify that the **Api Address** is `http://127.0.0.1:2200`.  

Click the **+** next to the opened Terminal, and select **Open New Terminal** to start fourth terminal.

In this terminal, set the VAULT_ADDR to `http://127.0.0.1:2200`.

```
export VAULT_ADDR='http://127.0.0.1:2200'
```{{execute T4}}

Check the `node2` server status:

```
vault status
```{{execute T4}}
