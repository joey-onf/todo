This repository is used for task tracking
=========================================

Search
------

| Topic     | Description                                |
| --------- | -------------------------------------------|
| [repo:voltha](https://jira.opencord.org/browse/VOL-5226?jql=labels%20IN%20(release-notes)%20AND%20(resolution%20IS%20EMPTY)) | Search for lingering release tasks. |
| [repo:voltha-docs](https://jira.opencord.org/browse/VOL-5226?jql=labels%20IN%20(release)%20AND%20(resolution%20IS%20EMPTY))  | Search for lingering documentation tasks. |

Topic(s)
--------

| Topic     | Description                                |
| --------- | -------------------------------------------|
| onf-make  | Common makefile repository items           |
| voltha    | Voltha related jira tickets and todo items |
| bin       | Repository helper scripts                  |

| Subdir    | Description                                |
| --------- | -------------------------------------------|
| [code-reviews](reviews/README.md)        | Pending code reviews  |
| [voltha](voltha/README.md)          | VOLTHA tracking tickets              |
| [bbsim](voltha/bbsim/README.md)     | Simulator tickets                    |
| [jjb](voltha/jjb/README.md)         | Jira tickets for syntax checking targets |
| [voltha-onos](voltha/voltha-onos/README.md) | REPO:voltha-onos patches and jira tickets |
| [voltctl](voltha/votlctl/README.md) | voltctl tickets                      | 
| [voltha-docs](voltha/voltha-docs/README.md)     | Tickets for REPO:voltha-docs |
| [voltha-openolt-adapter](voltha/voltha-openolt-adapter/README.md)  | Jira tickets for REPO: voltha-openolt-adapter |
| [voltha-protos](voltha/voltha-protos/README.md)  | repo:[voltha-protos](https://gerrit.opencord.org/plugins/gitiles/voltha-protos) |
| [pre-release-triage](voltha/pre-release-triage/README.md)  | |

Software Upgrades
-----------------

- [docker](docker/README.md)
- [docker lib ver deps](upgrades/README.md)

Jira search strings
-------------------

| Label         | Search for jira tickets decorated with a label |
| ------------- | -----------------------------------------------|
| release       | Release task                                   |
| release-notes | Release documentation task                     |
