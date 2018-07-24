<img src="https://s3-us-west-1.amazonaws.com/education-yh/Vault_Icon_FullColor.png" alt="Logo"/>

[HashiCorp Vault](https://www.vaultproject.io)'s PKI secret engine generates dynamic X.509 certificates. With this secrets engine, services can get certificates without going through the usual manual process of generating a private key and Certificate Signing Request (CSR), submitting to a Certificate Authority (CA), and waiting for a verification and signing process to complete.  Vault's build-in authentication and authorization mechanisms provide the verification functionality.

In this tutorial, we’ll be setting up Vault to act as an intermediate CA to issue certificates specific to the Example application.



This lab demonstrates the following:

- Write
