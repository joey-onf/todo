ONOS Component: olt
===================

| What | URL                    | Status | Notes |
| ---- | ---------------------- | ------ | ----- |
| Component  | [olt](https://gerrit.opencord.org/plugins/gitiles/olt) | :hammer: | |
| current    | 5.2.7-SNAPSHOT | :green_circle: | |
| released   | [5.2.6](https://mvnrepository.com/artifact/org.opencord/olt) | :green_circle: | |
| api-job    | [G:35037](https://gerrit.opencord.org/c/olt/+/35037) <br> [J:314](https://jenkins.opencord.org/job/onos-app-release/314/console) | :green_circle: | |
| nexus-snap | 5.2.7-SNAP | :hammer: | Merge patch: publish snapshot artifact to nexus |
| maven      | [olt](https://mvnrepository.com/artifact/org.opencord/olt) | :hammer: | | Release staged on nexus, publishing to mvc |

ARTIFACTS: Publishing
=====================

| Status         | Artifact         | Notes |
| ------         | ---------------- | ----- |
| :hammer:       | [maven-artifacts](maven-artifacts.md) | |

ARTIFACTS: Jenkins
==================

| Status | Task | URL | Notes |
| ------ | ---- | --- | ----- |
| :green_circle: | jenkins-init  | [x](https://jenkins.opencord.org/job/onos-app-release)  | |
| :hammer: | jenkins-stage | [x](https://jenkins.opencord.org/job/maven-publish_olt)       | |
| :hammer: | [nexus-5.2.6](https://jenkins.opencord.org/job/maven-publish_olt/183/console) | |

ARTIFACTS: Published
====================

| Status | URL | Notes |    
| ------ | --- | ----- |
| :hammer: | [mvn-pkg](https://mvnrepository.com/artifact/org.opencord/olt)     | |
| :hammer: | [mvn-api](https://mvnrepository.com/artifact/org.opencord/olt-api) | |
| :hammer: | [mvn-app](https://mvnrepository.com/artifact/org.opencord/olt-app) | |

ARTIFACTS: Versioned
====================
        
| Status   | URL | Notes |
| -------- | --- | ----- |
| :hammer: | [pkg-5.2.6](https://mvnrepository.com/artifact/org.opencord/olt/5.2.6)     | |
| :hammer: | [api-5.2.6](https://mvnrepository.com/artifact/org.opencord/olt-api/5.2.6) | |
| :hammer: | [app-5.2.6](https://mvnrepository.com/artifact/org.opencord/olt-app/5.2.6) | |
