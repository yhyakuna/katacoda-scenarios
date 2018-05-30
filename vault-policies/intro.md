![HashiCorp Vault](Vault_Icon_FullColor.png)

[HashiCorp Vault](https://www.vaultproject.io) secures, stores, and tightly controls access to tokens, passwords, certificates, API keys, and other secrets in modern computing. Vault handles leasing, key revocation, key rolling, and auditing. Through a unified API, users can access an encrypted Key/Value store and network encryption-as-a-service, or generate AWS IAM/STS credentials, SQL/NoSQL databases, X.509 certificates, SSH credentials, and more.

Vault uses policies to govern the behavior of clients and instrument Role-Based Access Control (RBAC) by specifying access privileges (authorization).

When you first initialize Vault, the root policy gets created by default. The root policy is a special policy that gives superuser access to everything in Vault. This allows the superuser to set up initial policies, tokens, etc.

Everything in Vault is path based, and admins write policies to grant or forbid access to certain paths and operations in Vault. Vault operates on a secure by default standard, and as such, an empty policy grants no permissions in the system.

<br>

In this course, you will learn how to write an ACL policy.
