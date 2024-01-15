VOLTHA Release Tracker
======================

| Repository | Version | REL | A | B | C | D | E | F |
| ---------- | --------| --- | - | - | - | - | - | - |
| [voltha-protos](https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/heads/voltha-2.12) | [5.4.11](https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/heads/voltha-2.12/VERSION), [5.5.0-dev1](https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/heads/master/VERSION) | X | X | - | - | X | [34934](https://gerrit.opencord.org/c/voltha-protos/+/34934) | [34936](https://gerrit.opencord.org/c/voltha-protos/+/34936) |
| voltha-lib-go | [7.5.2](https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go/+/refs/tags/v7.5.2), 7.6.0-dev | X-[34919](https://gerrit.opencord.org/c/voltha-lib-go/+/34919) | | | | X | [34946](https://gerrit.opencord.org/c/voltha-lib-go/+/34946) | [34948](https://gerrit.opencord.org/c/voltha-lib-go/+/34948) |
| voltha-go     | 3.5.3  | X-[34922](https://gerrit.opencord.org/c/voltha-go/+/34922) | | | | | | |
| ofagent-go    | | | [VOL-5254](https://jira.opencord.org/browse/VOL-5254) | | | | | |
| voltha-openonu-adapter-go | 2.11.11 | | | [34951](https://gerrit.opencord.org/c/voltha-openonu-adapter-go/+/34951) | | | | |
| voltha-openolt-adapter    | 4.4.10 | | [34952](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/34952) | [34952](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/34952) | | | | |
|               | | | | | | | | |
|               | | | | | | | | |
 
Legend
------
  
| Legend | Description |
| ------ | ----------- |
| REL    | Repository released: tags and branches created, .gitreview and VERSION files updated   |
| A      | Baseline - update copyright notice and rebuild to establish a clean baseline           |
| B      | Update voltha-protos version                                                           |
| C      | Update ONOS components (break out individually as Ca=aaa, Cb=dhcp2relay, Cc=sadis, etc |
| D      | Create release tags (5.4.10)                                                           |
| E      | Update .gitreview and VERSION release branch (5.4.11)                                  |
| F      | Update .gitreview and VERSION on master (5.5.0)                                        |

## See Also

| Topic | Description |
| ----- | ----------- |
| [Released](release-meta.md)                   | Release status of tagging and branching by repository |
| [ONOS-components](ONOS-components.md)         | ONOS Components and versions |
| [ONOS-component-deps](ONOS-component-deps.md) | External dependency version for ONOS components |
| [X](../jcl/README.md)     | JCL: Jira Ticket Search |
| [X](../tag-and-branch.md) | Release {tag,branch}ing by repository |
