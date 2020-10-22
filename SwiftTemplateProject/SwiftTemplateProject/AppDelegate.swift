//
//  AppDelegate.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/10/20.
//

import UIKit
#if DEBUG
    import CocoaDebug
    import Instabug
    import Sentry
#endif

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
            //If Use Google's Protocol buffers
            CocoaDebug.protobufTransferMap = [
                                             "your_api_keywords_1": ["your_request_protobuf_className_1", "your_response_protobuf_className_1"],
                                             "your_api_keywords_2": ["your_request_protobuf_className_2", "your_response_protobuf_className_2"],
                                             "your_api_keywords_3": ["your_request_protobuf_className_3", "your_response_protobuf_className_3"]
                                             ]
            CocoaDebug.enable()
        Instabug.start(withToken: "fdd41cf135c918166b830c654a0064d6", invocationEvents: [.shake,.screenshot,.twoFingersSwipeLeft,.rightEdgePan,.floatingButton])
        
        SentrySDK.start { Options in
            Options.dsn = "https://915d22a708914aea89200968a5d9fb28@o465418.ingest.sentry.io/5477975"
            Options.debug = true
        }
        SentrySDK.capture(message: "My first test message")
//        SentrySDK.crash()
        #endif
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
