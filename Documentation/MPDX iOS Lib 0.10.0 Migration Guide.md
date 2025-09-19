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
- Choose Move when prompted to move to English.
![alt text](../ReadMeAssets/migrate-0.10.0/move-files-to-english.png) <br><br>
- Use Base Internationalization should now be unchecked and you should see 1 file localized in English.
![alt text](../ReadMeAssets/migrate-0.10.0/base-unchecked-files-english.png) <br><br>
- Your Usage Descriptions should also have English now instead of Base.
![alt text](../ReadMeAssets/migrate-0.10.0/engish-usage-description.png) <br><br>

##### 3) Update implementation for AppConfigInterface.

- Import RequestOperation.
- apiBaseUrl: String type changed to apiBaseUrl: ApiBaseUrl.
- AuthenticationConfiguration init argument label also changed to accessTokenProvider.
![alt text](../ReadMeAssets/migrate-0.10.0/app-config-changes.png) <br><br>