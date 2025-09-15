MPDX Client Example App
=======================

Includes a Swift Package Manager example project to facilitate in the creation of your templated MPDX iOS App. Note that these instructions were originally created in Xcode 14.2 and things may change in future versions of Xcode.

- [Steps To Create Templated MPDX iOS App](#steps-to-create-templated-mpdx-ios-app)
- [Configuring AppConfig](#configuring-appconfig)
- [Distribution](#distribution)

### Requirements

- Minimum iOS Target: iOS 14 <br>
- Dependency Manager: Swift Package Manager <br>
- MPDXiOSLib: View version [here](https://github.com/CruGlobal/mpdx-ios-lib/tags). <br>

### Steps To Create Templated MPDX iOS App

Follow these outlined steps to get your Xcode project setup and running against the MPDXiOSLib code-base.

- [Create A New Xcode Project](#create-a-new-xcode-project)
- [Install The MPDXiOSLib Dependency](#install-the-mpdxioslib-dependency)
- [Configure Your New Xcode Project](#configure-your-new-xcode-project)

### Create A New Xcode Project

Start by creating a new Xcode project. Make sure to choose the following when creating your new Xcode project.

- For the project template choose App.
- Ensure Use Core Data is not checked.
- If you wish to include your own tests then check include Tests otherwise you can leave this unchecked.

### Install MPDXiOSLib With Swift Package Manager

- Swift Package Manager Documentation is [here](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).
- Locate your Xcode project package dependencies and tap the add icon to add the MPDXiOSLib git repo.
  ![alt text](ReadMeAssets/swift-package-manager/xcode-locate-package-dependencies.png) <br><br>
- Enter the repo https://github.com/CruGlobal/mpdx-ios-lib.git in the search field.  
- Set Dependency Rule to Up to Next Minor Version.
- Set the minimum version. You can view the latest MPDXiOSLib version [here](https://github.com/CruGlobal/mpdx-ios-lib/blob/master/MPDXiOSLib.podspec#L4) or [here](https://github.com/CruGlobal/mpdx-ios-lib/tags).
- Add the Package. 
  ![alt text](ReadMeAssets/swift-package-manager/xcode-input-swift-package-mpdx-ios-lib.png) <br><br>
- Xcode will finish loading, then add package to target.
  ![alt text](ReadMeAssets/swift-package-manager/xcode-add-swift-package-mpdx-ios-lib.png) <br><br>
    
### Configure Your New Xcode Project

- Now it's time to finish configuring your Xcode project. 
- Open the .xcodeproj file.
- Configure your Xcode project build target.
  - Delete Mac under Supported Destinations.  Should be iPhone and iPad.
  - Set Minimum Deployments to iOS 14.0.
  - Set iPhone Orientation to Portrait.
  - Set iPad Orientation to Portrait, Landscape Left, Landscape Right.
  - Set Status Bar Style to Default.
  - Check Requires full screen.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-target-general.png) <br><br>
- Configure your Xcode project info.
  - Set the iOS Deployment Target to iOS 14.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-project-info.png) <br><br>
- Delete the .swift files that Xcode generated for SwiftUI projects.
  - Select the ContentView.swift and "YourProjectName"App.swift file and hit the delete key.
  - Choose the Move to Trash option.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-delete-swiftui-files.png) <br><br>
- Add Application Scene Manifest to Xcode build target info.
  - In your Xcode target > Info section, locate the Custom macOS Application Target Properties section.
  - Tap the plus icon on the bottom row option which will bring up a new row and start typing Application Scene Manifest.  Xcode should auto find this and tap enter when it does.  You should now see the added Application Scene Manifest and that's it.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-info-plist-add-application-scene-manifest.png) <br><br>
- Add AppDelegate.swift.
  - Right click on project folder and add new file.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-new-file.png) <br><br>
  - Choose Swift File template.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-new-swift-file-template.png) <br><br>
  - Input AppDelegate for name and choose Create. Don't create bridging header.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-add-app-delegate.png) <br><br>
  - If Xcode requests to configure an Objective-C bridging header choose Don't Create.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-dont-create-bridging-header.png) <br><br>
  - Complete the AppDelegate.swift implementation. An example is [here](https://github.com/CruGlobal/mpdx-ios-client-example-app/blob/main/ExampleProjects/SwiftPackageManager/MPDXClientExampleSwiftPackageManager/AppDelegate.swift).
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-app-delegate.png) <br><br>
  - AppDelegate.swift will need to provide an instance conforming to AppConfigInterface.swift in method override func getAppConfig().  See the next step for setting this up.
- Add AppConfig.swift.  Follow the same instructions you used for adding the AppDelegate.swift file and add AppConfig.swift.
  - For an AppConfig.swift reference you can view that [here](https://github.com/CruGlobal/mpdx-ios-client-example-app/blob/main/ExampleProjects/SwiftPackageManager/MPDXClientExampleSwiftPackageManager/AppConfig.swift).
  - Set your apiBaseUrl: String.
  - Set your authenticationConfiguration: AuthenticationConfiguration.
- IMPORTANT: Add usage descriptions. These are descriptions apple looks for when a user attempts to access their device contacts or device face id from the MPDX app.  Without these the app will crash. Since these files can't be bundled with  MPDXiOSLib, they must be manually added to your Xcode project.
  - To manually add them first download the latest MPDXiOSLib zip [here](https://github.com/CruGlobal/mpdx-ios-lib/archive/refs/heads/master.zip).
  - In finder look in the downloaded directory for /Sources/MPDXiOSLib/Resources/UsageDescriptions/ and copy the UsageDescriptions directory into your project directory where Assets.xcassets, Info.plist, and .entitlements live. Make sure you're in finder and not the Xcode project.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-usage-descriptions-directory.png) <br><br>
  - Back in Xcode right click your project directory and choose Add Files and choose the Usage Descriptions directory you just added. Ensure Create groups is checked.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-add-files.png) <br><br>
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-add-usage-descriptions.png) <br><br>
  - You should now see the Usage Descriptions InfoPlist files in your Xcode project.
    ![alt text](ReadMeAssets/configure-xcode-project/xcode-usage-descriptions.png) <br><br>
  - That's it. You should now be able to build and run Xcode. 

### App Localization

Localizable.strings files are bundled in MPDXiOSLib and by default your templated MPDX App will support the following languages found [here](https://github.com/CruGlobal/mpdx-ios-lib/blob/develop/fastlane/.env.default#L3).


### Configuring AppConfig

The AppConfigInterface.swift exists to configure anything specific to your app.  When creating the AppDelegate.swift you will override MPDXAppDelegate getAppConfig() to return your own instance with configuration settings.  AppConfigInterface.swift contains the following configuration attributes.

###### - apiBaseUrl: String
This is the base url that points to your API.  For example MPDX Staging uses https://api.stage.mpdx.org
###### - authenticationConfiguration: AuthenticationConfiguration

###### - coreDatabaseConfiguration: CoreDatabaseConfiguration
###### - deepLinkingConfiguration: DeepLinkingConfiguration?
This is optional and you can return a DeepLinkingConfiguration value to enable deeplinking into your app.  

###### - firebaseConfiguration: FirebaseConfiguration?
This is optional and you can return a FirebaseConfiguration value to enable firebase analytics.  Here you will provide the name of the GoogleService file .plist created in Firebase and added to your Xcode project.  For example in MPDX we use GoogleService-Info for the firebaseGoogleServiceFileName.

###### - googleAnalyticsConfiguration: GoogleAnalyticsConfiguration?
This is optional and you can return a GoogleAnalyticsConfiguration value to enable google analytics.  Here you will provide your google analtyics identifier.  The dispatch interval is optional and can be lowered for debugging purposes.
###### - impersonateConfiguration: MPDXApiImpersonateConfiguration?
For this setting return nil.  We've been experimenting with a way to impersonate users for debugging purposes only and this isn't something that is available.

### Distribution

For automated build distributions we use a GitHub Actions workflow with a combination of Fastlane and GitHub Actions secrets.   

###### Add Gemfile

The client example contains a Gemfile in the project directory.  Add this same Gemfile to your project directory.  The GitHub Actions workflow will utilize this Gemfile for installing any dependencies such as Fastlane.

###### Add Fastlane

This next step will involve adding Fastlane to your project.

In your project directory create a folder named fastlane and add the following files.  
- Fastfile
- Matchfile
- .gitignore
- .env.default

###### Fastfile

For the Fastfile copy the same contents as in the client example (https://github.com/CruGlobal/mpdx-ios-client-example-app/blob/main/fastlane/Fastfile).

###### Matchfile

For the Matchfile copy the contents from the client example (https://github.com/CruGlobal/mpdx-ios-client-example-app/blob/main/fastlane/Matchfile).

IMPORTANT: The git URL will need to be your own private repository git url for code signing.  See the section below for Fastlane Match.


###### .gitignore

For the .gitignore copy the same contents as in the client example (https://github.com/CruGlobal/mpdx-ios-client-example-app/blob/main/fastlane/.gitignore).

Fastlane creates an AppleAppStoreApi.json file which is used for the App Store Connect API so this file needs to be ignored.

###### .env.default

For the .env.default copy the same contents as in the client example (https://github.com/CruGlobal/mpdx-ios-client-example-app/blob/main/fastlane/.env.default).  You will need to update some values that are specific to your app.

APP_RELEASE_BUNDLE_IDENTIFIER - this value will be your app store app bundle id.
APP_STORE_CONNECT_API_KEY_JSON_FILE_PATH = this value must match the mpdx client example.

## Code Signing 
CODE_SIGNING_APP_BUNDLE_IDS - this value will be your app store app bundle id.
CODE_SIGNING_PROVISIONING_PROFILE_NAMES - this value would replace org.cru.mpdxclientexample with your app store app bundle id.
CODE_SIGNING_TARGETS - this value is the main target for your app.
CODE_SIGNING_TEAM_ID - this value will match your team id in the apple developer membership.

## Match
MATCH_GIT_BRANCH = "master"
MATCH_GIT_URL - this value will match the git url for the created code signing repo.
MATCH_KEYCHAIN_NAME = "orgcrumpdxclientexample"

## Gym
GYM_RELEASE_APP_BUNDLE_IDENTIFIER - this value 
GYM_RELEASE_PROVISIONING_PROFILE = "match AppStore org.cru.mpdxclientexample"
GYM_RELEASE_SCHEME = "MPDXClientExampleSwiftPackageManager"

###### Fastlane Match

This step will involve creating a private repository for storing your distribution certificate and provisioning profile for code signing.  Fastlane utilizes Match for sharing one code signing identity across your development team.  

For more information on the benefits of storing your code signing credentials in a private repository see (https://codesigning.guide/).

For instructions on setting up Fastlane Match see (https://docs.fastlane.tools/actions/match/).

Once Fastlane Match is setup, you will need to add the created private repository git url to a couple files in your fastlane folder.

- In your Matchfile, add the giturl with your created private repository git url.
- In your .env.default set the MATCH_GIT_URL value to your private repository git url.