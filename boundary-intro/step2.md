Boundary can run in a **dev mode** which is an all-in-one installation method for getting started with Boundary quickly. The dev mode is not a production installation but useful for experiment with Boundary locally.

Boundary dev mode starts:

- A controller server
- A worker server
- A Postgres database


Check the help message for `boundary dev` command.

```
boundary dev -h
```{{execute}}

There are a number of optional parameters available, but for now, start a dev server with default configurations.

```
boundary dev
```{{execute}}


**Example output:**

```
==> Boundary server configuration:

       [Controller] AEAD Key Bytes: WO1h2kTypqzGqPUs+zoDioVAWIoHDtYxRy4m56DEe8A=
         [Recovery] AEAD Key Bytes: xL3hZ1ePrJW2QUYx8mRgh4lGmRIf6+fOMFjHRfQJi9s=
      [Worker-Auth] AEAD Key Bytes: GJmSp2MHslM698m8i2a14Mvc/9/5bq7/jZLlN9c/oi0=
              [Recovery] AEAD Type: aes-gcm
                  [Root] AEAD Type: aes-gcm
           [Worker-Auth] AEAD Type: aes-gcm
                               Cgo: disabled
            Dev Database Container: happy_wing
                  Dev Database Url: postgres://postgres:password@localhost:32768?sslmode=disable
          Generated Auth Method Id: ampw_1234567890
  Generated Auth Method Login Name: admin
    Generated Auth Method Password: password
         Generated Host Catalog Id: hcst_1234567890
                 Generated Host Id: hst_1234567890
             Generated Host Set Id: hsst_1234567890
            Generated Org Scope Id: o_1234567890
        Generated Project Scope Id: p_1234567890
               Generated Target Id: ttcp_1234567890
                        Listener 1: tcp (addr: "127.0.0.1:9200", max_request_duration: "1m30s", purpose: "api")
                        Listener 2: tcp (addr: "127.0.0.1:9201", max_request_duration: "1m30s", purpose: "cluster")
                        Listener 3: tcp (addr: "127.0.0.1:9202", max_request_duration: "1m30s", purpose: "proxy")
                         Log Level: info
                             Mlock: supported: false, enabled: false
                           Version: Boundary v0.1.0
                       Version Sha: e08ab98a2b128ee202eae46551da23c831b4acfc
                Worker Public Addr: 127.0.0.1:9202

==> Boundary server started! Log data will stream in below:
```

Notice the following default configurations:

- Generated Auth Method Id: `ampw_1234567890`
- Generated Auth Method Login Name: admin
- Generated Auth Method Password: password

## Authenticate with Boundary

Display the help message for `boundary authenticate` command.

```
boundary authenticate help
```{{execute}}

Authenticate with Boundary.

```
boundary authenticate password -auth-method-id=ampw_1234567890 \
      -login-name=admin -password=password \
      -keyring-type=none -format=json | jq -r ".token" > boundary_token.txt
```{{execute}}

**Example output:**

Set the `BOUNDARY_TOKEN` environment variable.

```
export BOUNDARY_TOKEN=$(cat boundary_token.txt)
```{{execute}}
