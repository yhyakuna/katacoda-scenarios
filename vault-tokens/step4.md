A common use case of periodic token is long-running processes where generation of a new token can interrupt the entire system flow.  This task demonstrates the creation of a role and periodic token for such long-running process.

Get help on `auth/token` path:

```
vault path-help auth/token
```{{execute}}

The API endpoint to create a token role is `auth/token/roles`.

## Create a Token Role

Create a token role named, `monitor`.  This role has `base` policy attached and token renewal period of 24 hours.

```
clear
vault write auth/token/roles/monitor allowed_policies="base" period="24h"
```{{execute}}


Execute the following command to create a token for role, `monitor`, and save the generated token in a file named, `monitor_token.txt`.

```
vault token create -role="monitor" \
      | jq -r ".auth.client_token" > monitor_token.txt
```{{execute}}

Display the token details:

```
VAULT_TOKEN=$(cat monitor_token.txt) vault token lookup
```{{execute}}
