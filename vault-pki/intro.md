<img src="https://s3-us-west-1.amazonaws.com/education-yh/Vault_Icon_FullColor.png" alt="Logo"/>

[HashiCorp Vault](https://www.vaultproject.io)'s PKI secret engine supports generating self-signed root Certificate Authority (CA) and creating and signing Certificate Signing Request (CSR) for intermediate CAs.

These are different Vault PKI setups and related notes.

In each instance, for security reasons, the private key can only be exported at generation time, and the ability to do so is part of the command path (so it can be put into ACL policies).

If you plan on using intermediate CAs with Vault, it is suggested that you let Vault create CSRs and do not export the private key, then sign those with your root CA .


This lab demonstrates the following:

- Write
