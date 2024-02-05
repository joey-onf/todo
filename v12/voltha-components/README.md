# VOLTHA Components Release Detail

| Repo | dev-ver | rel-ver | Detail | Jira | Jenkisn | Notes |
| ---- | ------- | ------- | ------ | ---- | ------- | ----- |
| voltha-onos | 5.2.0-dev | 5.1.10 | [x](#REPO:voltha-onos) | [VOL-5271](https://jira.opencord.org/browse/VOL-5271) | [2](https://jenkins.opencord.org/job/verify_voltha-onos_sanity-test-voltha-2.12/2/console) | |

## WIP

- Baseline cleanup for branch=master

## REPO:voltha-onos

| Status | ID | Detail | Notes |
| ------ | -- | ------ | ----- |
| :hammer: | [VOL-5031](https://jira.opencord.org/browse/VOL-5031) | | Relase REPO:votlha-onos |
| :hammer: | [G:34397](https://gerrit.opencord.org/c/voltha-onos/+/34397) | VOL-5031 | Prep work on master branch |
| :red_square: | [J:346](https://jenkins.opencord.org/job/verify_voltha-onos_sanity-test/346) | [VOL-5269](https://jira.opencord.org/browse/VOL-5269) | VOLTHA Stack deploy fail <br> Cancelling nested steps due to timeout |
| :new: | [VOL-5270](https://jira.opencord.org/browse/VOL-5270) | VOL-5031 | QUESITON: What onos version should be used (?) v2.5.8 or v2.5.9 |
    
## Legend

| Label   | Description |
| Repo    | Convenience links to the gerrit/github repos |
| dev-ver | Repository version (branch=master)           |
| rel-ver | Repository version (branch=voltha-2.12)      |
