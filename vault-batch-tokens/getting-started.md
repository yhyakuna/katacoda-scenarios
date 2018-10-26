Enter the following command to start the Vault server in development mode.  

> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.


```
vault server -dev -dev-root-token-id="root"
```{{execute T1}}


Scroll up the Terminal to locate the following output:

```
==> Vault server configuration:

             Api Address: http://127.0.0.1:8200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: (not set)
                   Mlock: supported: false, enabled: false
                 Storage: inmem
                 Version: Vault v1.0.0-beta1
             Version Sha: ebc733f4ca5d362fdfb302ac75953228585c54a2

WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
and starts unsealed with a single unseal key. The root token is already
authenticated to the CLI, so you can immediately begin using Vault.
```

When Vault is running in development mode, it runs entirely in-memory that the data does not get **persisted**. This build-in, pre-configured server is useful for local development, testing and exploration.

<br>

## Login with root token

Click the **+** next to the opened Terminal, and select **Open New Terminal**.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/ops-another-terminal.png" alt="New Terminal"/>

In the **Terminal 2**, set the `VAULT_ADDR` environment variable:

```
export VAULT_ADDR='http://127.0.0.1:8200'
```{{execute T2}}

Login with the generated root token.

```
vault login root
```{{execute T2}}


Now, you are logged in as a `root` and ready to play!
