# Triage Builds

Builds on this page are used to flush out problems building VOLTHA using
a re-created AMI image.

[jenkins](https://jenkins.opencord.org)

---

| repo  | status | AMI | Notes |
| ----- | ------ | :-: | ----- |
| [bbsim](repo/bbsim/README.md) | | | |
| [helm-repo-tools](repo/helm-repo-tools/README.md) | | | |
| [voltha-docs](repo/voltha-docs/README.md) | nop | | |
| [voltha-go-controller](repo/voltha-go-controller/README.md) | | ![#32CD32](https://placehold.co/15x15/633974/633974.png) | |
| [voltha-helm-charts](repo/voltha-helm-charts/README.md) | | | |
| [voltha-lib-go](repo/voltha-lib-go/README.md) | | | |
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

| Repo | Notes |
| ---- | ----- |
| [voltha-openolt-adapter](https://jenkins.opencord.org/search/?q=voltha-openolt-adapter&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |
| [voltha-protos](https://jenkins.opencord.org/job/verify_voltha-openolt-adapter_unit-test-tests/search/?q=voltha-pro&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |

[repo:voltha-openolt-adapter](repo/voltha-openolt-adapter/README.md)
[repo:ci-management](repo/ci-management/README.md)

## repo:voltha-docs

| URL | Description |
| --- | ----------- |
| [index](https://jenkins.opencord.org/search/?q=voltha-docs&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |
| [JJB-35292](https://gerrit.opencord.org/c/ci-management/+/35292) | |

| job | status | new-ami |
| --- | ------ | ------- |
| [tag-check-voltha-docs](https://jenkins.opencord.org/job/tag-check_voltha-docs/) | | |
