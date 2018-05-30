Now, create a token attached to the `base` policy so that you can test it.

You are going to run the `vault token` command. To print the help text:

```
vault token -h
```{{execute}}

To view the full list of optional parameters for `vault token create` operation, run the following command:

```
vault token create -h
```{{execute}}

Create a new token:

```
vault token create -policy="base"
```{{execute}}

A built-in policy, `default`, is attached to all tokens and provides common permissions.

Authenticate with Vault using the generated `token`:

```
vault login <token>
```
