# MPDX iOS Lib 0.10.0 Migration Guide
MPDXiOSLib 0.10.0 is the latest major release of MPDXiOSLib.

This guide is provided in order to ease the transition of existing applications to MPDXiOSLib version 0.10.0.

Below are the following steps needed when upgrading to MPDXiOSLib 0.10.0.

##### 1) Upgrade MPDXiOSLib to min version 0.10.0.
- Ensure MPDXiOSLib dependency is being pulled in via swift package manager and min version is 0.10.0.
![alt text](../ReadMeAssets/migrate-0.10.0/update-min-version.png) <br><br>

##### 2) Ensure uses base internationalization is unchecked.
- Locate Use Base Internationalization and uncheck.
![alt text](../ReadMeAssets/migrate-0.10.0/uncheck-use-base-internationalization.png) <br><br>

##### 3) Update implementation for AppConfigInterface.