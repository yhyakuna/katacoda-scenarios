Read the details about the Generated target by its target ID which is `ttcp_1234567890`.

```
boundary targets read -id ttcp_1234567890
```{{execute T2}}

Use the `boundary connect` command to SSH into the localhost.

```
boundary connect ssh -target-id ttcp_1234567890
```{{execute T2}}

Return to the first **Terminal** to view the Boundary server log.


Exit out of the SSH shell.

```
exit
```{{execute T2}}


## Exec command

The `boundary connect` can execute clients even when there is no built-in wrapper subcommand for it using `-exec`. The `-exec` flag is a very powerful tool, allowing you to wrap Boundary TCP sessions in your preferred client. You can use this flag to create an authenticated proxy to almost anything.


Let's update the default TCP target (`ttcp_1234567890`) port from `22` to `443` using the `boundary targets update` command.

```
boundary targets update tcp -default-port 443 -id ttcp_1234567890
```{{execute T2}}

Execute the cURL command using the `-exec` flag.

```
boundary connect -exec curl -target-id ttcp_1234567890 \
     -- -vvsL --output /dev/null hashicorp.com
```{{execute T2}}
