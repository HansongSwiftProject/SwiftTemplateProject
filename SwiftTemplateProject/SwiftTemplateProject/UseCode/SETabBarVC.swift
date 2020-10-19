//
//  SETabBarVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/11/20.
//

import UIKit

/// 简单的tabbar实现
class SETabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers?.append(AViewController.init())
        viewControllers?.append(BViewController.init())
        viewControllers?.append(CViewController.init())
        viewControllers?.append(DViewController.init())
        
        let mTabBar  = UITabBar.init()
        
        
        mTabBar.items?.append(createTabBarItems(title: "Features", imag:#imageLiteral(resourceName: "list") , index: 0))
        mTabBar.items?.append(createTabBarItems(title:"Handicaps", imag:#imageLiteral(resourceName: "groups"), index: 1))
        mTabBar.items?.append(createTabBarItems(title: "Fonts", imag:#imageLiteral(resourceName: "pencil") , index: 2))
        mTabBar.items?.append(createTabBarItems(title: "Colors", imag:#imageLiteral(resourceName: "colors") , index: 3))
        mTabBar.items?.append(createTabBarItems(title: "Captions", imag: #imageLiteral(resourceName: "image.pdf"), index: 4))
        viewControllers = [AViewController.init(),BViewController.init(),CViewController.init(),DViewController.init()]
    }
    
    
    func createTabBarItems(title:String?,imag:UIImage?,index:Int?) -> UITabBarItem {
        let tabrBarItem = UITabBarItem.init(title: title, image:imag , tag:index ?? 0)
        return tabrBarItem
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
