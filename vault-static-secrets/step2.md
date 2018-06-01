Write a secret into `secret/training` path:

```
vault kv put secret/training username="student01" password="pAssw0rd"
```{{execute}}

Expected output:

```
Key              Value
---              -----
created_time     2018-05-02T18:12:33.258249295Z
deletion_time    n/a
destroyed        false
version          1
```

### Read the Secrets

To read the secrets in `secret/training` path, run the following command:

```
vault kv get secret/training
```{{execute}}

The output displays the **Metadata** of the secret as well as the actual data. The metadata contains the creation time and the version number.


If you want to retrieve only the **username** value from `secret/training`, use the `-field` flag:

```
vault kv get -field=username secret/training
```{{execute}}


#### Question

What will happen to the contents of the secret when you execute the following command?

```
vault kv put secret/training password="another-password"
```{{execute}}

￼
#### Answer

It creates another version of the secret, version 2.

When you read the data at `secret/training`, **username** no longer exists!

> This is very important to understand. The  key/value secret engine does **NOT** merge or add values. If you want to add/update a key, you must specify all the existing keys as well; otherwise, ***data loss*** can occur!


If you wish to partially update the value, use `patch`:

```
vault kv patch secret/training course="Vault 101"
```{{execute}}

This time, you should see that the `course` value is added to the existing key.

```
vault kv get secret/training
```{{execute}}
