
Triage Builds
-------------

Builds on this page are used to flush out problems building VOLTHA using a re-created AMI image.

[jenkins](https://jenkins.opencord.org)

---

| repo  | status | jira | gerrit | jenkins | Triage | Notes |
| ----- | ------ | ---- | ------ | ------- | ------ | ----- |
| voltha-protos | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | | [35288](https://gerrit.opencord.org/c/voltha-protos/+/35288) | [664](https://jenkins.opencord.org/job/verify_voltha-protos_unit-test/664/console) | | |
| voltha-docs | nop | | [35291](https://gerrit.opencord.org/c/voltha-docs/+/35291) | [35071-merged](https://gerrit.opencord.org/c/voltha-docs/+/35071) | | |


Legend
------

| Status | Description |
| ------ | ------------------------------------------------------  |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | FAIL  |
| ![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png) | PASS  |
| ![#808080](https://placehold.co/15x15/808080/808080.png) | IDLE  |
| ![#32CD32](https://placehold.co/15x15/633974/633974.png) | UNSET |
| ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | LIME |


repo:voltha-docs
================

| URL | Description |
| --- | ----------- |
| [index](https://jenkins.opencord.org/search/?q=voltha-docs&Jenkins-Crumb=123f3d8f227c841c76a00612d59eb799c178bb574b50d3bc78ef94ec3b57cd34) | |
| [JJB-35292](https://gerrit.opencord.org/c/ci-management/+/35292) | |

| job | status | new-ami |
| --- | ------ | ------- |
| [tag-check-voltha-docs](https://jenkins.opencord.org/job/tag-check_voltha-docs/) | | |

