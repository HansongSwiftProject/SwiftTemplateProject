//
//  HCRootControllerProvider.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/13/20.
//

import Foundation
import UIKit
import ESTabBarController_swift

enum HCRootConrollerProvider {
    //MARK: 故事版实现方式
    static func storyBoardStyle() -> UIViewController{
        let story:UIStoryboard? = UIStoryboard.init(name: "BaseStoryboard", bundle: Bundle.main)
        return  story?.instantiateInitialViewController() ?? UIViewController.init()
    }
    //MARK: 系统纯代码
    static  func systemStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let  vc1 = templateViewController.init()
        let  vc2 = templateViewController.init()
        let  vc3 = templateViewController.init()
        let  vc4 = templateViewController.init()
        let  vc5 = templateViewController.init()
        let  vc6 = templateViewController.init()
        
        vc1.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        vc1.view.backgroundColor = UIColor.red
        
        vc2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        vc2.view.backgroundColor = UIColor.green
        
        vc3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        vc3.view.backgroundColor = UIColor.brown
        vc4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        vc4.view.backgroundColor = UIColor.purple
        vc5.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        vc5.view.backgroundColor = UIColor.systemPink
        tabBarController.tabBar.shadowImage = nil
            
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        return tabBarController
    }
    //MARK: 自定义的
    static  func customStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = templateViewController()
        let v2 = templateViewController()
        let v3 = templateViewController()
        let v4 = templateViewController()
        let v5 = templateViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    //MARK: 混合
    static  func mixtureStyle() ->ESTabBarController{
        let tabBarController = ESTabBarController()
        let v1 = UINavigationController(rootViewController: DemoTableViewController())
        let v2 = templateViewController()
        let v3 = templateViewController()
        let v4 = templateViewController()
        let v5 = templateViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    
}
