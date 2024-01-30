ONOS Component Versions
=======================

| Component | Status | Notes |
| --------- | ------ | ----- |
| [aaa](aaa/README.md)                 | :green_circle: | |
| [bng](bng/README.md)                 | :green_circle: | |
| [dhcpl2relay](dhcpl2relay/README.md) | :green_circle: | |
| [igmpproxy](igmpproxy/README.md)     | :green_circle: | |
| [kafka](kafka-onos/README.md)        | :question:     | Main package exists, *-api & *-app are not searchable/missing |
| [mcast](mcast/README.md)             | :green_circle: | |
| [olt](olt/README.md)                 | :green_circle: | |
| [olttopology](olttopology/README.md) | :green_circle: | |
| [pppoeagent](pppoeagent/README.md)   | :green_circle: | |
| [sadis](sadis/README.md)             | :green_circle: | |
 
## ONOS package dependencies: External

| Dependency | Package | Version |
| ---------- | ------- | --------|
| com.fasterxml.jackson.core | [jackson-databind](https://gerrit.opncord.org/plugins/gitiles/sadis/+/refs/heads/master/app/pom.xml#90) | 2.10.2 |     
| com.fasterxml.jackson.core | jackson-core             | 2.10.2 |     

## See Also

| URL | Description |
| --- | ----------- |
| [publish patches](https://gerrit.opencord.org/q/owner:do-not-reply%2540opennetworking.org) | ONOS Patches for publishing release/dev versions |


Mahir
=====

| ONOS | Gerrit | Notes |
| ---- | ------ | ----- |
| bng  | [b37](https://gerrit.opencord.org/c/bng/+/34990/1/pom.xml#b37) | |