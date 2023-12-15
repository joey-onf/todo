This repository is used for task tracking
=========================================

Search
------

| Topic     | Description                                |
| --------- | -------------------------------------------|
| [repo:voltha](https://jira.opencord.org/issues/?jql=%40;resolution%20IS%20EMPTY%41%20AND%20%40;labels%20in%20%40;"release"%41%41) | Search for open release tasks. |
| [repo:voltha-docs](https://jira.opencord.org/issues/?jql=(resolution%20IS%20EMPTY)%20AND%20(labels in ("release-notes"))) | Search for open documentation tasks. |

Topic(s)
--------

| Topic     | Description                                |
| --------- | -------------------------------------------|
| onf-make  | Common makefile repository items           |
| voltha    | Voltha related jira tickets and todo items |
| bin       | Repository helper scripts                  |

| Subdir    | Description                                |
| --------- | -------------------------------------------|
| [voltha](voltha/README.md)          | VOLTHA tracking tickets              |
| [bbsim](voltha/bbsim/README.md)     | Simulator tickets                    |
| [jjb](voltha/jjb/README.md)         | Jira tickets for syntax checking targets |
| [voltctl](voltha/votlctl/README.md) | voltctl tickets                      | 
| [voltha-docs](voltha/voltha-docs/README.md)     | Tickets for REPO:voltha-docs |
| [voltha-openolt-adapter](voltha/voltha-openolt-adapter/README.md)  | Jira tickets for REPO: voltha-openolt-adapter |
| [voltha-protos](voltha/voltha-protos/README.md)  | repo:[voltha-protos](https://gerrit.opencord.org/plugins/gitiles/voltha-protos) |

Software Upgrades
-----------------

- [docker](upgrades/README.md)

Jira search strings
-------------------

| Label         | Search for jira tickets decorated with a label |
| ------------- | -----------------------------------------------|
| release       | Release task                                   |
| release-notes | Release documentation task                     |
