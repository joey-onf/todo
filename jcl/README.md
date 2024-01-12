JCL: Jira Ticket Queries
========================

## Release

| URL | Description |
| --- | ----------- |
| [x](https://jira.opencord.org/browse/VOL-5250?jql=(project%20IN%20(SEBA%2CVOL))%20AND%20(fixVersion%20in%20(%22VOLTHA%20v2.12%22))%20AND%20(resolved%20IS%20EMPTY)) | Unresolved v2.12 tickets |
| [x](https://jira.opencord.org/browse/VOL-5249?jql=(project%20IN%20(SEBA%2CVOL))%20AND%20(resolved%20IS%20NOT%20EMPTY)%20AND%20(fixVersion%20IS%20NOT%20EMPTY)) | Tickets to consider for release notes. |
| [x](https://jira.opencord.org/browse/VOL-4371?jql=(%20project%20IN%20(SEBA%2CVOL)%20)%20AND%20(Resolved%20%3E%3D%202022-12-31)%20AND%20(Resolved%20%3C%3D%202024-01-01)%20AND%20(resolution%20NOT%20IN%20(%22Duplicate%22%2C%22Won%27t%20Do%22%2C%22Won%27t%20Fix%22))%20AND%20(resolved%20IS%20NOT%20EMPTY)%20AND%20(fixversion%20IS%20EMPTY)) | CLOSED: fix/Version not set |
| [x](https://jira.opencord.org/issues/?jql=project%20in%20(SEBA%2C%20VOL)%20AND%20status%20in%20(%22In%20Progress%22%2C%20%22To%20Do%22)%20AND%20fixVersion%20%3D%20%22VOLTHA%20v2.12%22) | label in {bbsim,Testing} |

| URL | Description |
| --- | ----------- |
| [x](https://gerrit.opencord.org/q/(project:voltha-system-tests+OR+project:voltha-helm-charts+OR+project:voltha-onos+OR+project:ofagent-go+OR+project:openolt+OR+project:voltha-lib-go+OR+project:+voltha-go+OR+project:+voltha-openonu-adapter-go+OR+project:voltha-protos+OR+project:voltha-openolt-adapter)+AND+status:open+AND+-is:wip+AND+-owner:joey%2540opennetworking.org) | TST Agenda: Patches |
| [x](https://jira.opencord.org/issues/?jql=project%20in%20(SEBA%2C%20VOL)%20AND%20status%20in%20(%22In%20Progress%22%2C%20%22To%20Do%22)%20AND%20fixVersion%20%3D%20%22VOLTHA%20v2.12%22) | TST Agenda: Tasks |

    
## See Also

| Topic | Description |
| ----- | ----------- |
| :red-circle: | testing |
| :green-circle: | testing |

    