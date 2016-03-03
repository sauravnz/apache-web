apache-cookbook Cookbook
========================
This cookbook installs and configure apache for proxypass and Mod_jk wor

Requirements
------------
CentOS
RHEL

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### apache-cookbook::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['apache-cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### apache-cookbook::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `apache-cookbook` in your node's `run_list` for proxypass:

```json
{
  "name":"my_node",
  "run_list": [
      "recipe[fake::default]",
      "recipe[fake::proxy_setup]"
  ]
}
```

e.g.
Just include `apache-cookbook` in your node's `run_list` for proxypass:

```json
{
  "name":"my_node",
  "run_list": [
      "recipe[fake::default]",
      "recipe[fake::modjk_setup]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.


License and Authors
-------------------
Authors: TODO: List authors
