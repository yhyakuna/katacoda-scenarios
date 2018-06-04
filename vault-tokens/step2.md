Review the help message on token renewal:

```
vault token renew -h
```{{execute}}


Let's create another token with base policy and TTL of 80 seconds:

```
vault token create -ttl 80s -format=json | jq -r ".auth.client_token" > token_80s.txt
```{{execute}}


Execute the following command to take a look at the token details:

```
vault token lookup $(cat token_80s.txt)
```{{execute}}

The output displays the **`ttl`** left with this token in seconds.

## Renew the Token

Execute the following command to renew the token and double its TTL:

```
vault token renew -increment=160s $(cat token_80s.txt)
```{{execute}}


Look up the token details again to verify that is TTL has been updated.

```
vault token lookup $(cat token_80s.txt)
```{{execute}}
