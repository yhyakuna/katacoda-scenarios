In the editor pane, select the file named, `base.hcl ` under `/root`.

Write the following policy rules in the editor (the following snippet can be copied into the editor):

<pre class="file" data-filename="base.hcl" data-target="replace">
path "secret/training" {
   capabilities = ["create", "read", "update", "delete" ]
}
</pre>


Get help for the vault policy command:

```
vault policy -h
```{{execute}}


To view the full list of optional parameters for `vault policy write` operation, run the following command:

```
vault policy write -h
```{{execute}}
