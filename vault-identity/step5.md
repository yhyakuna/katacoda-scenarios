Now, test to understand how a token inherits the capabilities from its associating group.

Login as bob with userpass auth method:

```
vault login -method=userpass username="bob" \
      password="training"
```{{execute}}


Test to see if the token has an access to the following paths:

- `secret/data/test`:  
  ```
  vault token capabilities secret/data/test
  ```{{execute}}

- `secret/data/training_test`:  
  ```
  vault token capabilities secret/data/training_test
  ```{{execute}}

- `secret/data/team/qa`:  
  ```
  vault token capabilities secret/team/qa
  ```{{execute}}

- `secret/data/team/eng`:  
  ```
  vault token capabilities secret/team/qa
  ```{{execute}}
