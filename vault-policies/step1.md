> Everything in Vault is **path** based, and admins write policies to grant or forbid access to certain paths and operations in Vault. Vault operates on a secure by default standard, and as such, an ***empty policy grants no permissions*** in the system.

Before begins, let's check which secret engines have been enabled: `vault secrets list`{{execute}}

The output should look like:

```
Path          Type         Description
----          ----         -----------
cubbyhole/    cubbyhole    per-token private secret storage
identity/     identity     identity store
secret/       kv           key/value secret storage
sys/          system       system endpoints used for control, policy and debugging
```

For each of those path, you must write policies to allow any operation against it.


### Write a Policy File

You are going to author an ACL policy in [HCL](https://github.com/hashicorp/hcl) format. HCL is JSON compatible; therefore, JSON can be used as completely valid input.

In the editor pane, right-click on the `root` and select **New > File** to create a file named, `base.hcl `.

Open the file in the editor, and enter the following policy rules in the editor (the following snippet can be copied into the editor):

<pre class="file" data-filename="base.hcl" data-target="replace">
path "secret/data/training" {
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
