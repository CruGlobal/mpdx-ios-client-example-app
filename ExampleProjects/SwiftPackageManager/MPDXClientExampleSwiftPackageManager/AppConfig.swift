//
//  AppConfig.swift
//  MPDXClientExampleSwiftPackageManager
//
//  Created by Levi Eggert on 7/19/23.
//  Copyright © 2023 Cru. All rights reserved.
//

import Foundation
import MPDXiOSLib
import RequestOperation

class AppConfig: AppConfigInterface {
    
    init() {
        
    }
    
    var apiBaseUrl: ApiBaseUrl {
        return ApiBaseUrl(scheme: .https, host: "set-your-host-here")
    }
    
    var authenticationConfiguration: AuthenticationConfiguration {
        return AuthenticationConfiguration(
            accessTokenProvider: OktaAccessTokenProvider<NoDecodableOktaUserData>(
                clientId: "set-your-okta-client-id",
                logoutRedirectUri: "set-your-okta-logout-redirect-uri",
                issuer: "set-your-okta-issuer",
                redirectUri: "set-your-okta-redirect-uri"
            )
        )
    }
    
    var coreDatabaseConfiguration: CoreDatabaseConfiguration {
        return CoreDatabaseConfiguration(
            loadFromPodResourceBundleName: "MPDXiOSLib_CoreDataModel",
            dataModelFilename: "mpdxDataModel",
            appGroupId: nil,
            storeSqliteFilename: "mpdxDataModel"
        )
    }
    
    var deepLinkingConfiguration: DeepLinkingConfiguration? {
        return nil
    }
    
    var firebaseConfiguration: FirebaseConfiguration? {
        return nil
    }
    
    var googleAnalyticsConfiguration: GoogleAnalyticsConfiguration? {
        return nil
    }
    
    var impersonateConfiguration: MPDXApiImpersonateConfiguration? {
        return nil
    }
}
