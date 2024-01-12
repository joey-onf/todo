BBSIM
=====



Epic
----

| jira | gerrit | Description |
| -----| ------ | ------------|
| [VOL-5125](https://jira.opencord.org/browse/VOL-5125) | | Tracking ticket for bbsim failures in jenkins vip job view |

### Job Failures

| jenkins | gerrit | Description |
| --------| ------ | ------------|
| [x](https://jenkins.opencord.org/view/All%20Jobs/job/periodic-voltha-openonu-go-test-bbsim) [2313](https://jenkins.opencord.org/view/All%20Jobs/job/periodic-voltha-openonu-go-test-bbsim/2313/) |  | periodic-voltha-openonu-go-test-bbsim |
Jenkins Jobs
------------

| jenkins | Description |
| ------- | ------------|
| [x](https://jenkins.opencord.org/job/verify_bbsim_unit-test)   | verify_bbsim_unit-test   |
| [x](https://jenkins.opencord.org/job/verify_bbsim_sanity-test) | verify_bbsim_sanity-test |
Makefile tickets
----------------

| jira | gerrit | Description |
| -----| ------ | ------------|
| [VOL-4883](https://jira.opencord.org/browse/VOL-4883) | | github-release-bbsim: downstream pipeline failure.  GO_SH problem with dangling quotes|
| [VOL-4884](https://jira.opencord.org/browse/VOL-4884) | | Refactor bbsim target logic |



Release Tickets
---------------

| jira | gerrit | Jenkins | Description |
| -----| ------ | ------- | ------------|
| [VOL-5118](https://jira.opencord.org/browse/VOL-5118) | | | repo:bbsim, jenkins: github-release-bbsim failure |
| [VOL-4974](https://jira.opencord.org/browse/VOL-4974) | | | bbsim-release job: kind command not found |
| [VOL-4906](https://jira.opencord.org/browse/VOL-4906) | | | github-release-bbsim job failing |
| [VOL5021](https://jira.opencord.org/browse/VOL-5021)  | | | Deploy bbsim |
| | [34866](https://gerrit.opencord.org/c/bbsim/+/34866) | [349](https://jenkins.opencord.org/job/github-release_bbsim/349/console) | Patch accepted, github-release_bbsim failed |

REPO: voltha-protos
-------------------

| jira | gerrit | Description |
| -----| ------ | ------------|
| [VOL-5125](https://jira.opencord.org/browse/VOL-5122) | [G:34206](https://gerrit.opencord.orlg/c/voltha-protos/+/34206) | Triage repo:voltha-protos failure, job verify_voltha-protos_unit-test failing </code>|
| [VOL-5192](https://jira.opencord.org/browse/VOL-5192) | | bbsim: update voltha-protos to version v5.4.10 |

Testing: BBSIM
--------------

## verify_bbsim_sanity-test

| jira | gerrit | Description |
| -----| ------ | ------------|
| [VOL-5127](https://jira.opencord.org/browse/VOL-5127) | | verify_bbsim_sanity-test failure         |


### [VOL-5127](https://jira.opencord.org/browse/VOL-5127)

- Intermittent ONOS failure, unrelated to VOLTHA.


Testing: BBSIM
--------------

| jira | gerrit | Description |
| -----| ------ | ------------|
| [VOL-4849](https://jira.opencord.org/browse/VOL-4849) | | Test suite: status=UNSATABLE periodic-software-upgrade-tests-bbsim |
| [VOL-4853](https://jira.opencord.org/browse/VOL-4853) | | Triage bulk test failures in periodic-voltha-multiple-olts-test-bbsim |
| [VOL-5094](https://jira.opencord.org/browse/VOL-5094) | | test failure: periodic-voltha-memory-leak-test-bbsim |
| [VOL-5157](https://jira.opencord.org/browse/VOL-5157) | | verify_bbsim_unit-test failures in history |

### verify_bbsim_sanity-test

| jira | gerrit | Description |
| -----| ------ | ------------|
| [VOL-5145](https://jira.opencord.org/browse/VOL-5145) | | v2.12 - verify_bbsim_sanity-test failure |


  
Topic Index
-----------

---

| Topic | Description |
| ----- | ------------|
| [{SEARCH}](https://jira.opencord.org/issues/?jql=(text%20~%20"bbsim")%20AND%20(resolution%20IS%20EMPTY)) | Jira Search |
| [epics](topics/epics.md)             | Tracking Tickets        |
| [makefiles](topics/makefiles.md)     | BBSIM Makefile tickets  |
| [jenkins urls](topics/jenkins.md)    | BBSIM Jenkins URLs      |
| [release](topics/release.md)         | BBSIM Release Tickets   |
| [test](topics/tests.md)              | Jenkins Job Failures    |
| [voltha-protos](topics/repo-voltha-protos.md) | REPO:voltha-proto jira tickets |
   
