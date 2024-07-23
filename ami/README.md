
Triage Builds
-------------

Builds on this page are used to flush out problems building VOLTHA using a re-created AMI image.

[jenkins](https://jenkins.opencord.org)

---

| repo  | status | jira | gerrit | jenkins | Triage | Notes |
| ----- | ------ | ---- | ------ | ------- | ------ | ----- |
| [helm-repo-tools](repo/helm-repo-tools/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |
| [voltha-docs](repo/voltha-docs/README.md) | nop | | [35291](https://gerrit.opencord.org/c/voltha-docs/+/35291) | [35071-merged](https://gerrit.opencord.org/c/voltha-docs/+/35071) | | |
| [voltha-go-controller](repo/voltha-go-controller/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |
| [votlha-helm-charts](repo/votlha-helm-charts/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |
| [voltha-lib-go](repo/voltha-lib-go/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |
| [voltha-openolt-adapter](repo/voltha-openolt-adapter/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | [35071-merged](https://gerrit.opencord.org/c/voltha-docs/+/35071) | [550](https://jenkins.opencord.org/job/verify_voltha-docs_unit-test/550/console) | linkcheck fail | |
| voltha-protos | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | [35288](https://gerrit.opencord.org/c/voltha-protos/+/35288) | [664](https://jenkins.opencord.org/job/verify_voltha-protos_unit-test/664/console) | | |
| [votlha-system-tests](repo/votlha-system-tests/README.md) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | |  | | |


Legend
------

| Status | Description |
| ------ | ------------------------------------------------------  |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | FAIL  |
| ![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png) | PASS  |
| ![#808080](https://placehold.co/15x15/808080/808080.png) | IDLE  |
| ![#32CD32](https://placehold.co/15x15/633974/633974.png) | WIP   |
| ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | LIME  |


SEARCH
======

| Repo | Notes |
| ---- | ----- |
| [voltha-openolt-adapter](https://jenkins.opencord.org/search/?q=voltha-openolt-adapter&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |
| [voltha-protos](https://jenkins.opencord.org/job/verify_voltha-openolt-adapter_unit-test-tests/search/?q=voltha-pro&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |

[repo:voltha-openolt-adapter](repo/voltha-openolt-adapter/README.md)
[repo:ci-management](repo/ci-management/README.md)



repo:voltha-docs
================

| URL | Description |
| --- | ----------- |
| [index](https://jenkins.opencord.org/search/?q=voltha-docs&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |
| [JJB-35292](https://gerrit.opencord.org/c/ci-management/+/35292) | |

| job | status | new-ami |
| --- | ------ | ------- |
| [tag-check-voltha-docs](https://jenkins.opencord.org/job/tag-check_voltha-docs/) | | |
