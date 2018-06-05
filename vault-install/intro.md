
[HashiCorp Vault](https://www.vaultproject.io) secures, stores, and tightly controls access to tokens, passwords, certificates, API keys, and other secrets in modern computing. Vault handles leasing, key revocation, key rolling, and auditing. Through a unified API, users can access an encrypted Key/Value store and network encryption-as-a-service, or generate AWS IAM/STS credentials, SQL/NoSQL databases, X.509 certificates, SSH credentials, and more.

Vault uses [policies](https://www.vaultproject.io/docs/concepts/policies.html) to govern the behavior of clients and instrument Role-Based Access Control (RBAC) by specifying access privileges (authorization).

When you first initialize Vault, the root policy gets created by default. This root policy is a special policy that gives superuser access to everything in Vault. Therefore, it is recommended that a token with root policy is used for just enough initial setup or in emergencies. As a best practice, use tokens with an appropriate set of policies based on your role in the organization.

<br>

In this scenario, you will learn how to write an ACL policy in Vault.
