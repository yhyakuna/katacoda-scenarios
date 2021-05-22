```
wget https://releases.hashicorp.com/sentinel/0.18.2/sentinel_0.18.2_linux_amd64.zip
unzip -d /usr/local/bin sentinel_0.18.2_linux_amd64.zip
```{{execute}}

```
wget https://releases.hashicorp.com/vault/1.7.2+ent/vault_1.7.2+ent_linux_amd64.zip
unzip -d /usr/local/bin vault_1.7.2+ent_linux_amd64.zip
```{{execute}}


Confirm that the Sentinel simulator is available.

```shell
which sentinel && sentinel version
```{{execute}}

The example CIDR check EGP from the presentation along with a set of tests is available in the `workshop-one` directory.

```shell
tree
```{{execute}}

The output should include `cidr-check.sentinel` and the `test` directory as follow:

```
.
├── cidr-check.sentinel
├── Desktop
│   └── code.desktop
├── log
│   ├── nohup.log
│   └── vault.log
├── setup.sh
└── test
    └── cidr-check
        ├── fail.json
        │   └── fail.json
        └── success.json
            └── success.json

6 directories, 7 files
```

If everything is present, proceed to the next step; otherwise, try the command again and proceed only files are loaded.
