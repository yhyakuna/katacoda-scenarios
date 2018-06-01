In order for the apps to acquire a valid token to read secrets from `secret/dev` path, it must run the unwrap operation using this token.

Since you are currently logged in as a root, you are going to perform the following to demonstrate the apps operations:

1. Create a token with default policy
2. Authenticate with Vault using this default token
3. Unwrap the secret to obtain the apps token
4. Verify that you can read `secret/dev` using the apps token


Use `vault unwrap` command to retrieve the wrapped secrets as follow:

```
vault unwrap <wrapping_token>

or

VAULT_TOKEN=<wrapping_token> vault unwrap

or

vault login <wrapping_token>
vault unwrap
```

Let's unwrap the secret which contains the client token with `apps-policy`. The following command stores the resulting token in `client-token.txt`.

```
vault unwrap $(cat wrapping-token.txt) -format=json | jq -r ".auth.client_token" > client-token.txt
```{{execute}}

Log into Vault using the token you just uncovered:

```
vault login $(cat client-token.txt)
```{{execute}}

Remember that `apps-policy` has a very limited privilege that the policy does not grant permissions on the `secret/dev` path. Run the following command to verify the behavior.

```
vault read secret/dev
```{{execute}}

You should receive "permission denied" error.
