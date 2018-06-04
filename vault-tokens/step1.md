When you have a scenario where an app talks to Vault only to retrieve a secret (e.g. API key), and never again.  If the interaction between Vault and its client takes only a few seconds, there is no need to keep the token alive for longer than necessary.  Let's create a token which is only valid for 30 seconds.


Review the help message on token creation:

```
vault token create -h
```{{execute}}

## Create a Short-Lived Token

To specify the life of a token, run the `vault token create` command with `-ttl` parameter:

```
vault token create -ttl=<duration>
```

```
clear
```{{execute}}

Execute the following command to create a token whose TTL is **30 seconds**:

```
vault token create -ttl=30s -format=json | jq -r ".auth.client_token" > ttl_token.txt
```{{execute}}

> Notice that the generated token inherits the parent token's policy.  For the training, you are logged in with `root` token.  When you create a new token, it inherits the parent token's policy unless you specify with **`-policy`** parameter (e.g. `vault token create -policy="base" -ttl=30s`).


## Test the Token

```
vault login $(cat ttl_token.txt)
```{{execute}}

The output displays the **`ttl`** left with this token in seconds.


Wait for a few seconds and re-run the lgoin command:

```
vault login $(cat ttl_token.txt)
```{{execute}}

You should receive **permission denied** error. After 30 seconds, the token gets revoked automatically, and you can no longer make any request with this token.


Log back in with `root` token:

```
vault login $(cat root_token.txt)
```{{execute}}
