Gerrit dashboard
----------------

| Changesets | who | Description |
| ---------- | --- | ----------- |
| [attention:self](https://gerrit.opencord.org/q/attention:self) | my | View unmerged patches |
| | |
| [need:+2 approval](https://gerrit.opencord.org/q/status:open%20label:Code-Review<2) | all | Unreviewed patches |
| [need:+1 verify](https://gerrit.opencord.org/q/status:open%20label:Verified<1%20label:Code-Review>1) | all | jenkins failures |
| | | |
| [is:open](https://gerrit.opencord.org/q/is:open) | all | View open changesets |
| [is:open+wip](https://gerrit.opencord.org/q/is:open+is:wip) | all | View WIP changesets |

VOLTHA: Pending Code Reviews
----------------------------
    
---

| Topic | Description |
| ----- | ------------|
| [bbsim](topics/bbsim.md) | SCA lint failure cleanups |
| [makefiles](topics/makefiles.md) | repo:onf-make and makefile refactoring |
| [vgc/golang-upgrade](topics/golang-upgrade.md) | Patches needed by the golang upgrade |
| [REPO:voltha-docs](topics/voltha-docs.md)  | Gerrit patches submitted for repo:voltha-docss |
| [REPO:voltha-openolt-adapter](topics/voltha-openolt-adapter.md)  | Repair problems reported by (sca) lint -- golang static code analysis |
