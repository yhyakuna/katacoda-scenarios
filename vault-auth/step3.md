Authenticate using the username and password you just created.

The command would be:

```
vault login -method=userpass username=<user_name> password=<password>
```

Execute the following command to login:

```
vault login -method=userpass username="student01" password="training"
```{{execute}}

When you successfully authenticate with Vault using your username and password, Vault returns a **token**.  From then on, you can use this token to make API calls and/or run CLI commands.
