[HashiCorp Vault](https://www.vaultproject.io)'s secret engines are components responsible for managing secrets:

- Secrets are pieces of sensitive information that can be used to access infrastructure, resources, data, etc.
- Some secret engines simply store and read data
    - Like encrypted Redis/Memcached
- Some connect to other services and generate dynamic credentials on-demand
- Others provide encryption as a service (EaaS), TOTP generation, certificates, etc.

This scenario demonstrates the [cubbyhole secret engine](https://www.vaultproject.io/docs/secrets/cubbyhole/index.html).

**Cubbyhole Secret Engine:**

- Used to store arbitrary secrets
  - Enabled by default at the cubbyhole/ path
- Its lifetime is linked to the token used to write the data
  - No concept of a time-to-live (TTL) or refresh interval for values in cubbyhole
  - Even the `root` token ***cannot*** read the data if it wasn't written by the `root`
- Cubbyhole secret engine _cannot be disabled_, _moved_ or _enabled multiple times_
