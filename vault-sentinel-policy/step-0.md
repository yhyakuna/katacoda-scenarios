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
