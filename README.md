# omar-security

[![Build Status](https://jenkins.radiantbluecloud.com/buildStatus/icon?job=omar-security-dev)]()

### Required environment variable
- OMAR_COMMON_PROPERTIES

### Optional environment variables
Only required for Jenkins pipelines or if you are running Artifactory and/or Openshift locally

- OPENSHIFT_USERNAME
- OPENSHIFT_PASSWORD
- ARTIFACTORY_USER
- ARTIFACTORY_PASSWORD

## How to Install omar-security-plugin locally

1. Git clone the following repo or git pull the latest version if you already have it.
```
  git clone https://github.com/ossimlabs/omar-common.git
  git clone https://github.com/ossimlabs/omar-security.git
```

2. Set OMAR_COMMON_PROPERTIES environment variable to the omar-common-properties.gradle (it is part of the omar-common repo).

3. Install omar-security-plugin
```
 cd omar-security/plugins/omar-security-plugin
 ./gradlew clean install
```
