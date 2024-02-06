# Voltha v2.12 release
 
# [V2.12 VOLTHA Components Release](voltha-components/README.md)    

| Repo | dev-ver | rel-ver | Detail | Jira | Jenkisn | Notes |
| ---- | ------- | ------- | ------ | ---- | ------- | ----- |
| bbsim       |            |        | | | [1286](https://jenkins.opencord.org/job/verify_bbsim_unit-test/1286/console) | ./release/bbr-linux-amd64 -pon 2 -onu 2 -logfile tmp.logs <br>Build timed out (after 20 minutes). Marking the build as failed. |
| voltha-onos | 5.2.0-dev  | 5.1.10 | [x](#REPO:voltha-onos) | [VOL-5271](https://jira.opencord.org/browse/VOL-5271) | [2](https://jenkins.opencord.org/job/verify_voltha-onos_sanity-test-voltha-2.12/2/console) | volthaStackDeploy failing |
| voltha-onos |            |        | | [VOL-5272](https://jira.opencord.org/browse/VOL-5272) | | Check on code review input from a release building patch. |
| voltctl     | 1.11.0-dev | 1.10.2 | | [VOL-5051](https://jira.opencord.org/browse/VOL-5051) | [508](https://jenkins.opencord.org/job/verify_voltctl_sanity-test/508/console) | Sanity test faiure reported |
    
## [docs.voltha.org](https://docs.voltha.org/master/release_notes/voltha_2.12.html)

| URL | Description |
| --- | ----------- |
| [x](https://docs.voltha.org/master/release_notes/voltha_2.12.html#features-improvements) | Features and improvements      |
| [x](https://docs.voltha.org/master/release_notes/voltha_2.12.html#bug-fixes)             | Bug Fixes                      |
| [x](https://docs.voltha.org/master/release_notes/voltha_2.12.html#test)                  | Testing                        |
| [x](https://docs.voltha.org/master/release_notes/voltha_2.12.html#onos-components)       | ONOS Components and versions   |
| [x](https://docs.voltha.org/master/release_notes/voltha_2.12.html#voltha-components)     | VOLTHA Components and versions |
    
----

## See Also

| URL | Description |
| --- | ----------- | 
| [x](https://docs.voltha.org/master/howto/code/release-bugfix.html) | HOWTO: Create a patch for the release branch |
