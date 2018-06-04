Review the help message on token renewal:

```
vault token renew -h
```{{execute}}

First, create a policy named, `base` by executing the following command:

```
docker cp base.hcl vault:/base.hcl
clear
vault policy write base base.hcl
```{{execute}}


Let's create another token with base policy and TTL of 60 seconds, and save the generated token in a file named, `token_60s.txt`.

```
vault token create -ttl 60s -policy=base -format=json \
     | jq -r ".auth.client_token" > token_60s.txt
```{{execute}}


Execute the following command to take a look at the token details:

```
vault token lookup $(cat token_60s.txt)
```{{execute}}

The output displays the **`ttl`** left with this token in seconds.

## Renew the Token

Execute the following command to renew the token and double its TTL:

```
vault token renew -increment=120s $(cat token_60s.txt)
```{{execute}}


Look up the token details again to verify that is TTL has been updated.

```
vault token lookup $(cat token_60s.txt)
```{{execute}}
