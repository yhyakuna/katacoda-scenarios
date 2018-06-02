Log back in with root token:

```
vault login $(cat root_token.txt)
```{{execute}}

Execute the capabilities command to check permissions on secret/data/training_dev path.

```
vault token capabilities $(cat token.txt) secret/data/training_dev
```{{execute}}

Where $(cat token.txt) is the token with `base` policy attached.

This lists the capabilities of a token on a path granted by its attached policies. When unexpected behavior was encountered, this is an easy method to check the policy for the token.

<br>

Execute the command without a token:

```
vault token capabilities secret/data/training_dev
```{{execute}}

With absence of a token, the command checks the capabilities of current token.
