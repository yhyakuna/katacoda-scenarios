Initialization is the process configuring the Vault. This only happens once when the server is started against a new backend that has never been used with Vault before. During initialization, the encryption keys are generated, unseal keys are created, and the initial root token is setup.

To initialize Vault use `vault operator init` operation.
<br>

From the **second** Terminal, execute the `vault operator init` command to initialize Vault:

```
vault operator init > key.txt
```{{execute T2}}


## Unseal Vault

Every initialized Vault server starts in the **sealed** state. From the configuration, Vault can access the physical storage, but it can't read any of it because it doesn't know how to decrypt it.

In order to prevent no one person from having complete access to the system, Vault employs [Shamir's Secret Sharing Algorithm](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing). Under this process, a secret is divided into a subset of parts such that a subset of those parts are needed to reconstruct the original secret. Vault makes heavy use of this algorithm as part of the unsealing process.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/shamirs-secret-sharing.png" alt="Shamir's Secret Sharing"/>

Typically each of these key shares is distributed to trusted parties in the organization. These parties must come together to "unseal" the Vault by entering their key share.

By default, the number of shared keys is `5` and quorum of unseal keys required to unseal vault is `3`.  (NOTE: This is configurable during the initialization.)

<br>

Execute the `vault operator unseal` command to enter the first unseal key:

```
vault operator unseal $(grep 'Key 1:' key.txt | awk '{print $NF}')
```{{execute T2}}

The output indicates that 1/3 of the unseal process was completed.

Pass the second unseal key:

```
vault operator unseal $(grep 'Key 2:' key.txt | awk '{print $NF}')
```{{execute T2}}


Finally, pass the third unseal key:

```
vault operator unseal $(grep 'Key 3:' key.txt | awk '{print $NF}')
```{{execute T2}}
