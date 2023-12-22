
Triage Builds
-------------

Jobs on this page were created by submitting a patch that contains purely
cosmetic edits.  Modifying comments, changing copyright notice dates,
auto-formatting source code to standards (ie: gofmt -s -e -w {path}).

Any jenkins job faiures reported will be due to latent corruption and
will need to be resolved.

---

| repo | gerrit             | jenkins | Triage | Notes               |
| ---- | ------------------ | ------- | ------ | --------------------|
| bbsim                     | [34896](https://gerrit.opencord.org/c/bbsim/+/34896) | [1284](https://jenkins.opencord.org/job/verify_bbsim_unit-test/1284/console), [1264](https://jenkins.opencord.org/job/verify_bbsim_sanity-test/1264/console) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |
| bbsim-sadis-server        | [34894](https://gerrit.opencord.org/c/bbsim-sadis-server/+/34894) | [48](https://jenkins.opencord.org/job/verify_bbsim-sadis-server_unit-test/48/), [47](https://jenkins.opencord.org/job/verify_bbsim-sadis-server_sanity-test/47/) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |
| voltha-go                 | [34889](https://gerrit.opencord.org/c/voltha-go/+/34889) | [1891](https://jenkins.opencord.org/job/verify_voltha-go_sanity-test/1891/console), [2793](https://jenkins.opencord.org/job/verify_voltha-go_unit-test-tests/2793/console), [2790](https://jenkins.opencord.org/job/verify_voltha-go_unit-test-lint/2790/console) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |
| voltha-go-controller      | [34893](https://gerrit.opencord.org/c/voltha-go-controller/+/34893) | | X | |    
| voltha-helm-charts        | [34898](https://gerrit.opencord.org/c/voltha-helm-charts/+/34898) | [219](https://jenkins.opencord.org/job/tag-check_voltha-helm-charts/219/console) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |
| voltha-lib-go             | [34887](https://gerrit.opencord.org/c/voltha-lib-go/+/34887) | [988](https://jenkins.opencord.org/job/verify_voltha-lib-go_unit-test/988/console) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |
| voltha-onos               | [34890](https://gerrit.opencord.org/c/voltha-onos/+/34890) | | x |
| voltha-openolt-adapter    | [34891](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/34891) | | X | |
| voltha-openonu-adapter-go | [34892](https://gerrit.opencord.org/c/voltha-openonu-adapter-go/+/34892) | [1465](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_unit-test-tests/1465/), [1466](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_unit-test-lint/1466/), [1711](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_sanity-test/1711/) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |
| voltha-protos             | [34895](https://gerrit.opencord.org/c/voltha-protos/+/34895) | [637](https://jenkins.opencord.org/job/verify_voltha-protos_unit-test/637/console) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |
| voltha-system-tests       | [34897](https://gerrit.opencord.org/c/voltha-system-tests/+/34897) | [3669](https://jenkins.opencord.org/job/verify_voltha-system-tests_sanity-test/3669/console) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | |

Legend
------

| Status | Description |
| ------ | ------------------------------------------------------ |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | FAIL |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | PASS |