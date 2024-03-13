VOLTHA: Jira Queries
====================

Open tickets
------------

| URL | Description |
| --- | ----------- |
| [X](https://jira.opencord.org/browse/VOL-5287?jql=component%20IN%20(bbsim)) | Component is BBSIM |
| [X](https://jira.opencord.org/browse/VOL-5118?jql=((labels%20IN%20(bbsim))%20or%20(text%20~%20%22bbsim%22))%20AND%20(resolved%20IS%20EMPTY)) | Jira tickets with label==bbsim or description==bbsim. |

JCL Queries
-----------
- ((labels IN (bbsim)) OR (text ~ "bbsim")) AND (RESOLVED IS EMPTY)
- (component in (bbsim))
- ((labels IN (bbsim,Testing))
