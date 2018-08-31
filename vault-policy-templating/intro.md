<img src="https://s3-us-west-1.amazonaws.com/education-yh/Vault_Icon_FullColor.png" alt="Logo"/>

## Prerequisites

* [Vault ACL Policies](https://www.katacoda.com/hashicorp/scenarios/vault-policies)
* [Vault Identity - Entities & Groups](https://www.katacoda.com/hashicorp/scenarios/vault-identity)

## Overview

Vault operates on a **secure by default** standard, and as such, an empty policy grants **no permissions** in the system. Therefore, policies must be created to govern the behavior of clients and instrument Role-Based Access Control (RBAC) by specifying access privileges (_authorization_).

Since everything in Vault is path based, policy authors must be aware of all existing paths as well as paths to be created.  

You can specify non-static paths in ACL policies was to use globs (`*`) at the end of paths.

For example:

```hcl
path "transit/keys/*" {
  capabilities = [ "read" ]
}

path "secret/webapp_*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
```

However, this makes the management and delegation tasks challenging. For example, allowing a user to change their own password by invoking the
`auth/userpass/users/<user_name>/password` endpoint can require either a policy for _every user_ or requires the use of Sentinel which is a part of [Vault Enterprise](/docs/enterprise/sentinel/index.html).

> This guide highlights the use of ACL templating which was introduced in **Vault 0.11**.
