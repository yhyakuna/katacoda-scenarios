Write policies which fulfill the following requirements:

- Each _user_ can perform all operations on their allocated key/value secret path (`user-kv/data/<user_name>`)
- The education _group_ has a dedicated key/value secret store for each region where all operations can be performed by the group members
 (`group-kv/data/education/<region>`)
- The _group_ members can update the group information such as metadata about the group (`identity/group/id/<group_id>`)

Policy authors can pass in a policy path containing double curly braces as templating delimiters: `{{<parameter>}}`.


## Available Templating Parameters

|                                    Name                                |                                    Description                               |
| :--------------------------------------------------------------------- | :--------------------------------------------------------------------------- |
| `identity.entity.id`                                                   | The entity's ID                                                              |
| `identity.entity.name`                                                 | The entity's name                                                            |
| `identity.entity.metadata.<<metadata key>>`                            | Metadata associated with the entity for the given key                        |
| `identity.entity.aliases.<<mount accessor>>.id`                        | Entity alias ID for the given mount                                          |
| `identity.entity.aliases.<<mount accessor>>.name`                      | Entity alias name for the given mount                                        |
| `identity.entity.aliases.<<mount accessor>>.metadata.<<metadata key>>` | Metadata associated with the alias for the given mount and metadata key      |
| `identity.groups.ids.<<group id>>.name`                                | The group name for the given group ID                                        |
| `identity.groups.names.<<group name>>.id`                              | The group ID for the given group name                                        |
| `identity.groups.names.<<group id>>.metadata.<<metadata key>>`         | Metadata associated with the group for the given key                         |
| `identity.groups.names.<<group name>>.metadata.<<metadata key>>`       | Metadata associated with the group for the given key                         |

<br>


Open the `user-tmpl.hcl`{{open}} file and enter the following policy rules in the editor (the following snippet can be copied into the editor):

<pre class="file" data-filename="user-tmpl.hcl" data-target="replace">
# Grant permissions on user specific path
path "user-kv/data/{{identity.entity.name}}/*" {
	capabilities = [ "create", "update", "read", "delete", "list" ]
}
</pre>


Next, open the `group-tmpl.hcl`{{open}} file and enter the following policy rules in the editor:

<pre class="file" data-filename="group-tmpl.hcl" data-target="replace">
# Grant permissions on the group specific path
# The region is specified in the group metadata
path "group-kv/data/education/{{identity.groups.names.education.metadata.region}}/*" {
	capabilities = [ "create", "update", "read", "delete", "list" ]
}

# Group member can update the group information
path "identity/group/id/{{identity.groups.names.education.id}}" {
  capabilities = [ "update", "read" ]
}
</pre>


This policy grants **create** and **read** operations on any path starting with `secret/data/training_`.

> **NOTE:**  When you are working with [_key/value secret engine v2_](https://www.vaultproject.io/api/secret/kv/kv-v2.html), the path to write policies would be `secret/data/<path>` even though the K/V command to the path is `secret/<path>`.  When you are working with [v1](https://www.vaultproject.io/api/secret/kv/kv-v1.html), the policies should be written against `secret/<path>`.  This is because the API endpoint to invoke K/V v2 is different from v1.

## Deploy policies

Execute the following command to create a policy:

```
vault policy write base base.hcl
```{{execute T2}}

Run the following command to list existing policies:

```
vault policy list
```{{execute T2}}

The list should include the `base` policy you just created.

The following command displays the policy you just created:

```
vault policy read base
```{{execute T2}}

<br>

***Optional:*** Execute the following command to examine the `default` policy.

```
vault policy read default
```{{execute T2}}
