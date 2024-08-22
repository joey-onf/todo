# Triage Builds [jenkins.opencord.org](https://jenkins.opencord.org)

Builds on this page are used to flush out problems building VOLTHA using
a re-created AMI image.


## By Repository
---

- Details per-repository jira tickets, test failures and patches.
- Failures reported using the new replacement AMI image based on Ubuntu 24.04.
- Testing failures captured in jira tickets.

| repo  | status | AMI | Notes |
| ----- | ------ | :-: | ----- |
| [bbsim](repo/bbsim/README.md) | | | |
| [repo:ci-management](repo/ci-management/README.md) | | | |
| [helm-repo-tools](repo/helm-repo-tools/README.md) | | | |
| [voltctl](repo/voltctl/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |
| [voltha-docs](repo/voltha-docs/README.md) | nop | | |
| [voltha-go-controller](repo/voltha-go-controller/README.md) | | ![#32CD32](https://placehold.co/15x15/633974/633974.png) | |
| [voltha-helm-charts](repo/voltha-helm-charts/README.md) | | | |
| [voltha-lib-go](repo/voltha-lib-go/README.md) | | 08/22 | |
| [voltha-openolt-adapter](repo/voltha-openolt-adapter/README.md) | | | |
| [voltha-openonu-adapter-go](repo/voltha-openonu-adapter-go/README.md) | | | |
| [voltha-protos](repo/voltha-protos/README.md) | | | |
| [voltha-system-tests](repo/voltha-system-tests/README.md) | | ![#32CD32](https://placehold.co/15x15/633974/633974.png) | |


## Legend

| Status | Description |
| ------ | ------------------------------------------------------  |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | FAIL  |
| ![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png) | PASS  |
| ![#808080](https://placehold.co/15x15/808080/808080.png) | IDLE  |
| ![#32CD32](https://placehold.co/15x15/633974/633974.png) | WIP   |
| ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | LIME  |

## SEARCH

---

- jenkins queries used to show per-repository pipeline jobs (not exhaustive, simple string match)

| Repo | Notes |
| ---- | ----- |
| [voltha-go-controller](https://jenkins.opencord.org/job/verify_voltha-go-controller_licensed/270/search/?q=voltha-go-contro) | |
| [voltha-openolt-adapter](https://jenkins.opencord.org/search/?q=voltha-openolt-adapter&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |
| [voltha-protos](https://jenkins.opencord.org/job/verify_voltha-openolt-adapter_unit-test-tests/search/?q=voltha-pro&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |


## Epics

---

- Meta tickets used to track classes of errors.
- Subtasks attached to these tickets captures test failures, etc.

| URL | Description |
| :-: | ----------- |
| [VOL-5352](https://jira.opencord.org/browse/VOL-5352) | AWS AMI Recreation |
| [VOL-5358](https://jira.opencord.org/browse/VOL-5358) | | 
| [VOL-5004](https://jira.opencord.org/browse/VOL-5004) | Release v2.12 tracking ticket |
| [VOL-5019](https://jira.opencord.org/browse/VOL-5019) | Publish latest version of VOLTHA software |

## repo:voltha-docs

| URL | Description |
| --- | ----------- |
| [index](https://jenkins.opencord.org/search/?q=voltha-docs&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |
| [JJB-35292](https://gerrit.opencord.org/c/ci-management/+/35292) | |

| job | status | new-ami |
| --- | ------ | ------- |
| [tag-check-voltha-docs](https://jenkins.opencord.org/job/tag-check_voltha-docs/) | | |
