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
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootIndex:Int8 = 3;

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
        Instabug.start(withToken: "fdd41cf135c918166b830c654a0064d6", invocationEvents: [.shake,.floatingButton,.rightEdgePan,.screenshot,.twoFingersSwipeLeft])
        
        SentrySDK.start { Options in
            Options.dsn = "https://915d22a708914aea89200968a5d9fb28@o465418.ingest.sentry.io/5477975"
            Options.debug = true
        }
//        SentrySDK.capture(message: "My first test message")
        //        SentrySDK.crash()
        #endif
        switch rootIndex {
        case 0:
           // MARK: storyBoard 实现
            window?.rootViewController =  HCRootConrollerProvider.storyBoardStyle()
            break
        case 1:
            // MARK: 纯代码实现
            window?.rootViewController =  HCRootConrollerProvider.systemStyle()
            break
        case 2:
            // MARK: 第三方库实现：ESTabBarController_swift
            window?.rootViewController =  HCRootConrollerProvider.customStyle()
            break
        case 3:
            // MARK: 第三方库实现：ESTabBarController_swift
            window?.rootViewController =  HCRootConrollerProvider.mixtureStyle()
            break
        default:
            window?.rootViewController =  HCRootConrollerProvider.storyBoardStyle()
        }
        window?.makeKeyAndVisible()
     
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
