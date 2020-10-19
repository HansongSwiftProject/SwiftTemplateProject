//
//  DemoHookVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/18/20.
//

import UIKit
import EasySwiftHook
import NotificationBannerSwift
class DemoHookVC: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        bannaerTip()
         A()
         B()
         C()
         D()
         E()
    }
    func A(){
        do {
            let object = MyObject()
            let token = try hookBefore(object: object, selector: #selector(MyObject.sayHello)) {
                print("You will say hello, right?")
            }
            object.sayHello()
            token.cancelHook() // cancel the hook
        } catch {
           
        }
    }
    func B(){
        do {
            let object = MyObject()
            
            // 1. The first parameter mush be AnyObject or NSObject or YOUR CLASS (In this case. It has to inherits from NSObject, otherwise will build error with "XXX is not representable in Objective-C, so it cannot be used with '@convention(block)'").
            // 2. The second parameter mush be Selector.
            // 3. The rest of the parameters are the same as the method.
            // 4. The return type mush be Void if you hook with `before` and `after` mode.
            // 5. The key word `@convention(block)` is necessary
            let hookClosure = { object, selector, name in
                print("Nice to see you \(name)")
                print("The object is: \(object)")
                print("The selector is: \(selector)")
            } as @convention(block) (AnyObject, Selector, String) -> Void
            let token = try hookAfter(object: object, selector: #selector(MyObject.sayHi), closure: hookClosure)
            
            object.sayHi(name: "Yanni")
            token.cancelHook()
        } catch {
           
        }
    }
    func C(){
        do {
            let object = MyObject()
            
            // 1. The first parameter mush be an closure. This closure means original method. The parameters of it are the same as "How to use: Case 2". The return type of it must be the same as original method's.
            // 2. The rest of the parameters are the same as "How to use: Case 2".
            // 3. The return type mush be the same as original method's.
            let hookClosure = {original, object, selector, left, right in
                let result = original(object, selector, left, right)
                // You can call original with the different parameters:
                // let result = original(object, selector, 12, 27).
                // You also can change the object and selector if you want. Don't even call the original method if needed.
                print("\(left) + \(right) equals \(result)") // 不放开这一行，不会出现，方法交换前后都实现
                return left * right
            } as @convention(block) ((AnyObject, Selector, Int, Int) -> Int, AnyObject, Selector, Int, Int) -> Int
            let token = try hookInstead(object: object, selector: #selector(MyObject.sum(left:right:)), closure: hookClosure)
            let left = 3
            let right = 4
            let result = object.sum(left: left, right: right)
            print("\(left) * \(right) equals \(result)")
            token.cancelHook()
        } catch {
           
        }
    }
    func D(){
        do {
            let token = try hookBefore(targetClass: MyObject.self, selector: #selector(MyObject.sayHello)) {
                print("You will say hello, right?")
            }
//            MyObject().sayHello() // 不放开这一行，不会出现，方法交换前后都实现
            token.cancelHook()
        } catch {
            
        }
    }
    func E(){
//        do {
//            let token = try hookClassMethodBefore(targetClass: MyObject.self, selector: #selector(MyObject.sayHello)) {
//                print("You will say hello, right?")
//            }
//            MyObject.sayHello()
//            token.cancelHook()
//        } catch {
//
//        }
    }
    internal func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
extension DemoHookVC:NotificationBannerDelegate{
    
    func bannaerTip(){
        let banner = NotificationBanner(title: "Basic Success Notification",
                                        subtitle: "Extremely Customizable!",
                                        style: .success)
        banner.delegate = self
        
        banner.onTap = {
            self.showAlert(title: "Banner Success Notification Tapped", message: "")
        }
        
        banner.onSwipeUp = {
            self.showAlert(title: "Basic Success Notification Swiped Up", message: "")
        }
        
        banner.show(queuePosition:QueuePosition.front, bannerPosition: BannerPosition.top)
    }
    
    func notificationBannerWillAppear(_ banner: BaseNotificationBanner) {
    }
    
    func notificationBannerDidAppear(_ banner: BaseNotificationBanner) {
    }
    
    func notificationBannerWillDisappear(_ banner: BaseNotificationBanner) {
    }
    
    func notificationBannerDidDisappear(_ banner: BaseNotificationBanner) {
    }
    
    
}
