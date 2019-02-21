<img src="https://s3-us-west-1.amazonaws.com/education-yh/Vault_Icon_FullColor.png" alt="Logo"/>

[HashiCorp Vault](https://www.vaultproject.io)'s secret engines are components responsible for managing secrets:


A modern system requires access to a multitude of secrets: database credentials, API keys for external services, credentials for service-oriented architecture communication, etc. Vault steps in to provide a centralized secret management system. The next step is to decide how your applications acquire the secrets from Vault.

This guide introduces [**Consul Template**](https://github.com/hashicorp/consul-template) and [**Envconsul**](https://github.com/hashicorp/consul-template) to help you determine if these tools speed up the integration of your applications once secrets are securely managed by Vault.

**NOTE:** Both Consul Template and Envconsul are open source tools.
