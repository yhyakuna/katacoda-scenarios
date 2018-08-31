You are going to create a new entity with base policy assigned.  The entity defines two entity aliases with each has a different policy assigned.

**Scenario:**  

Let's create an entity, **`bob_smith`** with a user **`bob`** as its entity alias. Also, create an internal group, **`education`** and add the **`bob_smith`** entity as its group member.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/vault-acl-templating.png" alt="Entity"/>

**NOTE:** For the purpose of training, you are going to work with the userpass auth method.  But in reality, the user `bob` might be a username that exists in Active Directory, Okta, etc.

## Create an Entity

Execute the following command to enable the userpass auth method:

```
vault auth enable userpass
```{{execute T2}}

First, create a new user, `bob`, in the userpass auth method:

- **username:** bob
- **password:** training

```
vault write auth/userpass/users/bob password="training"
```{{execute T2}}

Execute the following command to discover the mount accessor for the `userpass` auth method since `bob` is defined using the `userpass` auth method:

```
vault auth list \
    -format=json | jq -r '.["userpass/"].accessor' > accessor.txt
```{{execute T2}}

This command parses the output using `jq`, retrieves the mount accessor for `userpass` and save it in the `accessor.txt`{{open}} file.


Execute the following command to create a new entity named, `bob_smith` and save its ID in the `entity_id.txt` file:

```
vault write -format=json identity/entity name="bob_smith" \
     policies="user-tmpl" \
     | jq -r ".data.id" > entity_id.txt
```{{execute T2}}


Now, add user `bob` to the `bob_smith` entity by creating an entity alias:

```
vault write identity/entity-alias name="bob" \
     canonical_id=$(cat entity_id.txt) \
     mount_accessor=$(cat accessor.txt)
```{{execute T2}}

**NOTE:**  If you don't specify the `canonical_id` value, Vault automatically creates a new entity for this alias.  


Execute the following command to read the entity details:

```
vault read -format=json identity/entity/id/$(cat entity_id.txt)
```{{execute T2}}


## Create a Group

To clear the screen: `clear`{{execute T2}}

Execute the following command to create an internal group named, `education` and add `bob_smith` entity as a group member.  Also, assign the  `group-tmpl` policy to the group, and set some metadata.

```
vault write -format=json identity/group name="education" \
      policies="group-tmpl" \
      member_entity_ids=$(cat entity_id.txt) \
      metadata=region="us-west" \
      | jq -r ".data.id" > group_id.txt
```{{execute T2}}

The generated group ID is stored in the `group_id.txt`{{open}} file.
