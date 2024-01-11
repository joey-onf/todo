VOLTHA Release Tracker
======================

| Repository | Version | REL | A | B | C | D | E | F |
| ---------- | --------| --- | - | - | - | - | - | - |
| [voltha-protos](https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/heads/voltha-2.12) | [5.4.11](https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/heads/voltha-2.12/VERSION) | X | X | - | - | X | [34934](https://gerrit.opencord.org/c/voltha-protos/+/34934) | [34936](https://gerrit.opencord.org/c/voltha-protos/+/34936) |
| voltha-lib-go | 7.5.1  | [34919](https://gerrit.opencord.org/c/voltha-lib-go/+/34919) | | | | | | |
| voltha-go     | 3.5.3  | [34922](https://gerrit.opencord.org/c/voltha-go/+/34922) | | | | | | |
|               | | | | | | | | |
|               | | | | | | | | |
|               | | | | | | | | |
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

## Jira Searches

| URL | Description |
| --- | ----------- |
| [x](https://jira.opencord.org/browse/VOL-5250?jql=(project%20IN%20(SEBA%2CVOL))%20AND%20(fixVersion%20in%20(%22VOLTHA%20v2.12%22))%20AND%20(resolved%20IS%20EMPTY)) | Unresolved v2.12 tickets |
| [x](https://jira.opencord.org/browse/VOL-5249?jql=(project%20IN%20(SEBA%2CVOL))%20AND%20(resolved%20IS%20NOT%20EMPTY)%20AND%20(fixVersion%20IS%20NOT%20EMPTY)) | Tickets to consider for release notes. |
| [x](https://jira.opencord.org/browse/VOL-4371?jql=(%20project%20IN%20(SEBA%2CVOL)%20)%20AND%20(Resolved%20%3E%3D%202022-12-31)%20AND%20(Resolved%20%3C%3D%202024-01-01)%20AND%20(resolution%20NOT%20IN%20(%22Duplicate%22%2C%22Won%27t%20Do%22%2C%22Won%27t%20Fix%22))%20AND%20(resolved%20IS%20NOT%20EMPTY)%20AND%20(fixversion%20IS%20EMPTY)) | CLOSED: fix/Version not set |
| [x](https://gerrit.opencord.org/q/(project:voltha-system-tests+OR+project:voltha-helm-charts+OR+project:voltha-onos+OR+project:ofagent-go+OR+project:openolt+OR+project:voltha-lib-go+OR+project:+voltha-go+OR+project:+voltha-openonu-adapter-go+OR+project:voltha-protos+OR+project:voltha-openolt-adapter)+AND+status:open+AND+-is:wip+AND+-owner:joey%2540opennetworking.org) | TST Agenda: Patches |
| [x](https://jira.opencord.org/issues/?jql=project%20in%20(SEBA%2C%20VOL)%20AND%20status%20in%20(%22In%20Progress%22%2C%20%22To%20Do%22)%20AND%20fixVersion%20%3D%20%22VOLTHA%20v2.12%22) | TST Agenda: Tasks |
| [x](https://jira.opencord.org/issues/?jql=project%20in%20(SEBA%2C%20VOL)%20AND%20status%20in%20(%22In%20Progress%22%2C%20%22To%20Do%22)%20AND%20fixVersion%20%3D%20%22VOLTHA%20v2.12%22) | label in {bbsim,Testing} |


## See Also

| Topic | Description |
| ----- | ----------- |
| [ONOS-components](ONOS-components.md)         | ONOS Components and versions |
| [ONOS-component-deps](ONOS-component-deps.md) | External dependency version for ONOS components |


