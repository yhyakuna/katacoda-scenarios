Execute the following command to create a policy:

```
clear
vault policy write base base.hcl
```{{execute}}

Run the following command to list existing policies:

```
vault policy list
```{{execute}}

The following command displays the policy you just created:

```
vault policy read base
```{{execute}}
