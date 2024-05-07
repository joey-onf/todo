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
