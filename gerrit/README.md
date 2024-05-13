Gerrit Patches
==============

This page contains a grid mapping gerrit patches to jira tickets.
Format helps track transient failures and unresovled problems.

Patch Grid
==========

| Gerrit | Jira | Jenkins | Recheck | Conflict | [VOL-5291](https://jira.opencord.org/browse/VOL-5291) | [VOL-5311](https://jira.opencord.org/browse/VOL-5311) | [VOL-5331](https://jira.opencord.org/browse/VOL-5331) | [VOL-5332](https://jira.opencord.org/browse/VOL-5332) | [VOL-5335]() | Reviewed | Notes |
|  :---:  |  :---:  |  :---:  |  :---:  |  :---:  |  :---:  |  :---:  |  :---:  |  :---:  |  :---:  |  :---:  |  ---  |
| [19890](https://gerrit.opencord.org/c/voltha-system-tests/+/19890) |   |  |   |   |   |   |   |   |   |   |   |
| [34421](https://gerrit.opencord.org/c/openolt/+/34421) | [x](https://jira.opencord.org/browse/VOL-4988) |  |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |   |   |   | Compile&nbsp;failure |
| [34734](https://gerrit.opencord.org/c/voltha-openonu-adapter-go/+/34734) |   |  |   |   |   |   |   |   |   |   |   |
| [34962](https://gerrit.opencord.org/c/openolt/+/34962) |   | [x](https://jenkins.opencord.org/job/verify_openolt_unit-test/479/console) |   |   |   |   |   |   |   |   |   |
| [34993](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/34993) | [x](https://jira.opencord.org/browse/VOL-5255) |  |   |   |   |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | Locally&nbsp;modified&nbsp;files.<br>E2E&nbsp;pingtest&nbsp;fail |
| [35043](https://gerrit.opencord.org/c/olt/+/35043) |   |  |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |   |   |   |   |
| [35128](https://gerrit.opencord.org/c/voltha-protos/+/35128) |   |  |   |   |   |   |   |   |   |   |   |
| [35151](https://gerrit.opencord.org/c/openolt/+/35151) |   |  |   |   |   |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | Patch&nbsp;source&nbsp;problems |
| [35152](https://gerrit.opencord.org/c/voltctl/+/35152) |   | [x](https://jenkins.opencord.org/job/verify_voltctl_unit-test/651/consoleText) |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | Failure&nbsp;due&nbsp;to&nbsp;undef. |
| [35165](https://gerrit.opencord.org/c/voltha-openonu-adapter-go/+/35165) |   |  |   |   |   |   |   |   |   |   |   |
| [35173](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/35173) |   |  |   |   |   |   |   |   |   |   |   |
| [35177](https://gerrit.opencord.org/c/openolt/+/35177) |   |  |   |   |   |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) |   |
| [35195](https://gerrit.opencord.org/c/openolt/+/35195) |   |  |   |   |   |   |   |   |   |   | core.h&nbsp;error:&nbsp;'openolt::OnuAllocIdStatistics'&nbsp;has&nbsp;not&nbsp;been&nbsp;declared |
| [35209](https://gerrit.opencord.org/c/voltha-openonu-adapter-go/+/35209) | [x](https://jira.opencord.org/browse/VOL-5298), [x](https://jira.opencord.org/browse/VOL-5331) |  |   |   |   |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |   |
| [35216](https://gerrit.opencord.org/c/voltctl/+/35216) | [x](https://jira.opencord.org/browse/VOL-5305), [x](https://jira.opencord.org/browse/VOL-5331) |  |   |   |   |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   | merge&nbsp;conflicts |
| [35217](https://gerrit.opencord.org/c/voltha-go-controller/+/35217) |   | [x](https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/264/consoleText), [x](https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/261/consoleText), [x](https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/260/consoleText) |   |   |   |   |   |   |   |   |   |
| [35220](https://gerrit.opencord.org/c/voltctl/+/35220) |   |  |   |   |   |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | buildssa:&nbsp;errors&nbsp;in&nbsp;package:<br>Undef&nbsp;reported |
| [35225](https://gerrit.opencord.org/c/bbsim/+/35225) |   | [x](https://jenkins.opencord.org/job/verify_bbsim_sanity-test/1295/consoleText) |   |   |   |   |   |   |   |   |   |
| [35226](https://gerrit.opencord.org/c/voltha-helm-charts/+/35226) |   |  |   |   |   |   |   |   |   |   |   |
| [35227](https://gerrit.opencord.org/c/voltha-openonu-adapter-go/+/35227) | [x](https://jira.opencord.org/browse/VOL-5303), [x](https://jira.opencord.org/browse/VOL-5331) |  |   |   |   |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | [jenkins:1742](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_sanity-test/1742/consoleFull)&nbsp;-&nbsp;No&nbsp;failure&nbsp;detail |
| [35228](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/35228) |   |  |   |   |   |   |   |   |   |   | Test&nbsp;coverage&nbsp;failure.<br>Problem&nbsp;with&nbsp;golang&nbsp;linter.<br>Undef&nbsp;atts&nbsp;reported. |
| [35229](https://gerrit.opencord.org/c/openolt/+/35229) | [x](https://jira.opencord.org/browse/VOL-5291) |  |   |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | Patch&nbsp;compile&nbsp;problems. |
| [35236](https://gerrit.opencord.org/c/voltctl/+/35236) | [x](https://jira.opencord.org/browse/VOL-5291) |  |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | Fail&nbsp;due&nbsp;to&nbsp;undef |
| [35242](https://gerrit.opencord.org/c/voltha-docs/+/35242) |   |  |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |   |   |   |   |
| [35246](https://gerrit.opencord.org/c/voltha-openolt-adapter/+/35246) | [x](https://jira.opencord.org/browse/VOL-5322), [x](https://jira.opencord.org/browse/VOL-5335) |  |   |   |   |   |   |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |
| [35252](https://gerrit.opencord.org/c/voltha-go/+/35252) |   | [x](https://jenkins.opencord.org/job/verify_voltha-go_unit-test-lint/2813/), [x](https://jenkins.opencord.org/job/verify_voltha-go_unit-test-tests/2816/), [x](https://jenkins.opencord.org/job/verify_voltha-go_licensed/3066/) |   |   |   |   |   |   |   | ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | Several&nbsp;failures,&nbsp;patch&nbsp;related. |
| [35267](https://gerrit.opencord.org/c/voltha-go-controller/+/35267) |   | [x](https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/266/console) |   |   |   |   |   | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) |   |   |   |


Legend
------

| Status | Description |
| ------ | ------------------------------------------------------  |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) | FAIL  |
| ![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png) | PASS  |
| ![#808080](https://placehold.co/15x15/808080/808080.png) | IDLE  |
| ![#32CD32](https://placehold.co/15x15/633974/633974.png) | WIP   |
| ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) | LIME  |

Grid Columns
------------

| Column   | Description |
| -------- | ------------------------------------------------------  |
| Gerrit   | Reference number, link to a gerrit patch |
| Jira     | A list of jira tickets attached to the patch |
| Event    | conflict, recheck, etc|
| Notes    | |

Common / Transient unit test failures
-------------------------------------

| Column   | Description |
| -------- | ------------------------------------------------------  |
| [VOL-5311](https://jira.opencord.org/browse/VOL-5311) | Test Perform BBSim Sanity :: Validates the BBSim Functionality for|
| [VOL-5331](https://jira.opencord.org/browse/VOL-5331) | Voltha DT PODTests :: Test various end-to-end scenarios |
| [VOL-5335](https://jira.opencord.org/browse/VOL-5335) | Voltha TT PODTests :: Test various functional end-to-end scenarios for TT |
| [VOL-5332](https://jira.opencord.org/browse/VOL-5332) | SCA timeout failure (~python testing) |

Sanity E2E Test for OLT/ONU on POD for DT :: Validates E2E Ping Co... | FAIL |
------------------------------------------------------------------------------

| Repo | Gerrit | Notes |
| ---- | ------ | --- |
| voltha-openolt-adapter    | [jenkins:1978](https://jenkins.opencord.org/job/verify_voltha-openolt-adapter_sanity-test/1978/consoleFull)   | NOP job, add pre-commit hook config file |
| voltha-openonu-adapter-go | [jenkins:1747](https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_sanity-test/1747/console)    | NOP job, add pre-commit hook config file |

| Gerrit | PASS | FAIL | Notes |
| ------ | ---- | ---- | ----- |
| [35261](https://gerrit.opencord.org/c/voltctl/+/35261) | 1 | ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) - [J:542](https://jenkins.opencord.org/job/verify_voltctl_sanity-test/542/console) | NOP job, add pre-commit hook |

35217
-----

- https://gerrit.opencord.org/c/voltha-go-controller/+/35217
- https://github.com/joey-onf/todo/blob/origin/master/gerrit/data/35217

See Also
========

- [Open Gerrit Patches](https://gerrit.opencord.org/q/status:open)
