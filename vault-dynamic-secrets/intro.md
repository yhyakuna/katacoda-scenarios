<img src="https://s3-us-west-1.amazonaws.com/education-yh/Vault_Icon_FullColor.png" alt="Logo"/>

[HashiCorp Vault](https://www.vaultproject.io) can generate secrets on-demand for some systems. For example, when an app
needs to access an Amazon S3 bucket, it asks Vault for AWS credentials. Vault will generate an AWS credential granting permissions to access the S3 bucket. In addition, Vault will automatically revoke this credential after the TTL is expired.
