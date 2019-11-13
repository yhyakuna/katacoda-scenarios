Enter the following command to see the Vault server status.  

> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

```
vault status
```{{execute T1}}

Login with the generated root token.

```
vault login root
```{{execute T1}}

**Now, you are ready to explore Vault CLI!**


Open the `main.tf`{{open}} file and edit:

<pre class="file" data-filename="main.tf" data-target="add">
# Create 'training' policy
resource "vault_policy" "training" {
    name   = "training"
    policy = "${data.vault_policy_document.training.hcl}"
}
</pre>

<br>

## Useful Links

- [Getting Started: Built-in Help](https://www.vaultproject.io/intro/getting-started/help.html)
- [Vault Basic Concepts](https://www.vaultproject.io/docs/concepts/index.html)
- [Secrets Engines](https://www.vaultproject.io/docs/secrets/index.html)
