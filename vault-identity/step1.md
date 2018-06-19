You are going to create a new entity with base policy assigned.  The entity defines two entity aliases with each has a different policy assigned.

**Scenario:**  

A user, Bob Smith at ACME Inc. happened to have two sets of credentials: `bob` and `bsmith`.  To manage his accounts and link them to an identity `Bob Smith` in team, QA, you are going to create an entity for Bob.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/7-entity.png" alt="Entity"/>

For the purpose of training, you are going to work with the userpass auth method.  But in reality, the user `bob` might be a username exists in Active Directory, and `bsmith` might be Bob's username in GitHub, etc.


Execute the following command to enable the userpass auth method:

```
vault auth enable userpass
```{{execute T2}}

Next, create a new policy named, `base`:

```
vault policy write base base.hcl
```{{execute T2}}

To review the created policy:

```
vault policy read base
```{{execute T2}}

This policy grants CRUD operations on the path starting with `secret/training`.

<br>
Let's create two more policies: `test` and `team-qa`.

Execute the following command to create `test` policy.

```
vault policy write test test.hcl
```{{execute T2}}


Execute the following command to create `team-qa` policy.

```
vault policy write team-qa team-qa.hcl
```{{execute T2}}


At this point, you should have `base`, `test`, and `team-qa` policies:

```
vault policy list
```{{execute T2}}

<br>

## Create Users

Create a new user in userpass backend:

- **username:** bob
- **password:** training
- **policy:** test

```
vault write auth/userpass/users/bob password="training" \
    policies="test"
```{{execute T2}}


Create another user in userpass backend:

- **username:** bsmith
- **password:** training
- **policy:** team-qa

```
vault write auth/userpass/users/bsmith password="training" \
      policies="team-qa"
```{{execute T2}}
