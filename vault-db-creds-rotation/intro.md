<img src="https://s3-us-west-1.amazonaws.com/education-yh/Vault_Icon_FullColor.png" alt="Logo"/>

# Vault 1.2 Beta Demonstration

The [Secrets as a Service: Dynamic Secrets](https://learn.hashicorp.com/vault/secrets-management/sm-dynamic-secrets) guide demonstrates the use of Vault's database secrets engine to dynamically manage database credentials. Vault creates a unique set of username and password with specified time-to-live (TTL) every time a client (e.g. a user or application) requests. This allows each application to have its own database credentials.

But now, consider a classic use case where multiple applications use shared, **static** user accounts and periodically rotate the password (e.g. every 90 days). Because Vault creates a new set of credentials each time, adopting the database secrets engine requires some code change in those applications.

## Solution

Vault 1.2 database secrets engine enables organizations to automatically rotate the password for existing database users. This makes it easy to integrate the existing applications with Vault and leverage the database secrets engine for better secret management.

![DB Creds Rotation](https://education-yh.s3-us-west-1.amazonaws.com/katacoda-images/vault-db-rotate.png)
