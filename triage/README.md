
Triage Builds
-------------

Jobs on this page were created by submitting a patch that contains purely
cosmetic edits.  Modifying comments, changing copyright notice dates,
auto-formatting source code to standards (ie: gofmt -s -e -w {path}).

Any jenkins job faiures reported will be due to latent corruption and
will need to be resolved.

---

| repo  | jira | gerrit             | jenkins | Triage | Notes               |
| ----- | ---- | ------------------ | ------- | ------ | --------------------|
| bbsim-sadis-server |  | [34894](https://gerrit.opencord.org/c/bbsim-sadis-server/+/34894) | [48](https://jenkins.opencord.org/job/verify_bbsim-sadis-server_unit-test/48), [47](https://jenkins.opencord.org/job/verify_bbsim-sadis-server_sanity-test/47) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |
| bbsim | [VOL-5242](https://jira.opencord.org/browse/VOL-5242) | [34896](https://gerrit.opencord.org/c/bbsim/+/34896) | [1284](https://jenkins.opencord.org/job/verify_bbsim_unit-test/1284/console), [1264](https://jenkins.opencord.org/job/verify_bbsim_sanity-test/1264/console) | ![#32CD32](https://placehold.co/15x15/633974/633974.png) |  |
| sadis | [VOL-5250](https://jira.opencord.org/browse/VOL-5250) |  |  | ![#32CD32](https://placehold.co/15x15/633974/633974.png) |  |
| voltha-go-controller |  | [34893](https://gerrit.opencord.org/c/voltha-go-controller/+/34893) | [223](https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/223) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |
| voltha-go |  | [34907](https://gerrit.opencord.org/c/voltha-go/+/34907) |  | ![#D35400](https://placehold.co/15x15/D35400/D35400.png) |  |
| voltha-helm-charts |  | [34898](https://gerrit.opencord.org/c/voltha-helm-charts/+/34898) | [219](https://jenkins.opencord.org/job/tag-check_voltha-helm-charts/219/console) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |
| voltha-lib-go |  | [34903](https://gerrit.opencord.org/c/voltha-lib-go/+/34903) | [991](https://jenkins.opencord.org/job/verify_voltha-lib-go_unit-test/991/console) | ![#D35400](https://placehold.co/15x15/D35400/D35400.png) | Manual gofmt -s -e -w |
| voltha-onos |  | [34890](https://gerrit.opencord.org/c/voltha-onos/+/34890) | [312](https://jenkins.opencord.org/job/verify_voltha-onos_sanity-test/312) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |
| voltha-openolt-adapter |  | [34891](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/34891) | [1945](https://jenkins.opencord.org/job/verify_voltha-openolt-adapter_sanity-test/1945), [2437](https://jenkins.opencord.org/job/verify_voltha-openolt-adapter_unit-test-lint/2437), [2432](https://jenkins.opencord.org/job/verify_voltha-openolt-adapter_unit-test-tests/2432) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |
| voltha-openonu-adapter-go |  | [34892](https://gerrit.opencord.org/c/voltha-openonu-adapter-go/+/34892) | [1465](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_unit-test-tests/1465), [1466](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_unit-test-lint/1466), [1711](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_sanity-test/1711) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |
| voltha-protos |  | [34895](https://gerrit.opencord.org/c/voltha-protos/+/34895) | [637](https://jenkins.opencord.org/job/verify_voltha-protos_unit-test/637/console) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |
| voltha-system-tsts |  | [34897](https://gerrit.opencord.org/c/voltha-system-tests/+/34897) | [3669](https://jenkins.opencord.org/job/verify_voltha-system-tests_sanity-test/3669/console) | ![#808080](https://placehold.co/15x15/808080/808080.png) |  |

Legend
------

| Status | Description |
| ------ | ------------------------------------------------------  |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | FAIL  |
| ![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png) | PASS  |
| ![#808080](https://placehold.co/15x15/808080/808080.png) | IDLE  |
| ![#32CD32](https://placehold.co/15x15/633974/633974.png) | UNSET |
| ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | LIME |
