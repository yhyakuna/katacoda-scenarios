Execute the following command to create a policy:

```
clear
vault policy write base base.hcl
```{{execute}}

To verify that the policy was created, run the following command:

```
vault policy list
```{{execute}}

Run the following command to display the policy rules:

```
vault policy read base
```{{execute}}
