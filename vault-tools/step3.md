Envconsul launches a subprocess which dynamically populates environment variables from secrets read from Vault. Your applications then read those environment variables. Despite its name, Envconsul does **not** require a Consul cluster to operate. It enables flexibility and portability for applications across systems.

```
VAULT_TOKEN=$(cat token.txt) envconsul -upcase -secret kv-v1/customers/acme env
```{{execute T2}}
