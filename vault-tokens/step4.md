A common use case of periodic token is long-running processes where generation of a new token can interrupt the entire system flow.  This task demonstrates the creation of a role and periodic token for such long-running process.

Get help on `auth/token` path:

```
clear
vault path-help auth/token
```{{execute}}

The API endpoint to create a token role is `auth/token/roles`.

## Create a Token Role

Create a token role named, `monitor`.  This role has `base` policy attached and token renewal period of 24 hours.

```
vault write auth/token/roles/monitor allowed_policies="base" period="24h"
```{{execute}}


Now, create a token for role, monitor:

```
vault token create -role="monitor"
```{{execute}}


This token can be renewed multiple times indefinitely as long as it gets renewed before it expires.

### Step 6.4.4
Renew the token using API.  The endpoint for renewing a token is `auth/token/renew`.

    $ curl --header "X-Vault-Token: root" --request POST \
           --data '{"token":"<token>"}' \
           $VAULT_ADDR/v1/auth/token/renew | jq

Where `<token>` is the generated token at _Step 6.4.3_.

Output should look similar to:

    {
      "request_id": "a4a92f0b-16c7-9136-5803-4ba8f6cadbef",
      "lease_id": "",
      "renewable": false,
      "lease_duration": 0,
      "data": null,
      "wrap_info": null,
      "warnings": null,
      "auth": {
        "client_token": "5261419d-65ec-c380-60f0-e1f7635dc175",
        "accessor": "d33959e3-39ed-335b-5d41-cdea0323a1a4",
        "policies": [
          "base",
          "default"
        ],
        "metadata": null,
        "lease_duration": 86400,
        "renewable": true,
        "entity_id": ""
      }
    }
