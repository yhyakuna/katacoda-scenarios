Enter the following command to start the Vault server in development mode.  

> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

```
vault server -dev -dev-listen-address=0.0.0.0:8200
```{{execute T1}}


Launch the Web UI:

- https://[[HOST_SUBDOMAIN]]-8200-[[KATACODA_HOST]].environments.katacoda.com/ui

- http://[[HOST_SUBDOMAIN]]-8200-[[KATACODA_HOST]].environments.katacoda.com/ui



## Starting in non-dev mode

```
vault server -config=config.hcl
```{{execute T1}}

Click the **+** next to the opened Terminal, and select **Open New Terminal**.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/ops-another-terminal.png" alt="New Terminal"/>

In the **Terminal 2**, set the `VAULT_ADDR` environment variable:

```
export VAULT_ADDR='http://0.0.0.0:8200'

vault operator init -key-shares=1 -key-threshold=1 > key.txt

vault operator unseal $(grep 'Key 1:' key.txt | awk '{print $NF}')
```{{execute T2}}


**Now, you are ready to explore Vault CLI!**
