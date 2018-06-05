<img src="https://s3-us-west-1.amazonaws.com/education-yh/Vault_Icon_FullColor.png" alt="Logo"/>

[Vault's auth methods](https://www.vaultproject.io/docs/concepts/auth.html) perform authentication to verify the user or machine-supplied information. Some of the supported auth methods are targeted towards users while others are targeted toward machines or apps. For example, [LDAP](/docs/auth/ldap.html) auth method enables user authentication using an existing LDAP server while [AppRole](/docs/auth/approle.html) auth method is recommended for machines or apps.

The [Getting Started](/intro/getting-started/authentication.html) guide walks you through how to enable the GitHub auth method for user authentication.

This scenario demonstrates the **`userpass`** auth method which allows users to authenticate with Vault using a username and password combination.
