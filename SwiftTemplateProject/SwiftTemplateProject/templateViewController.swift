//
//  templateViewController.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/13/20.
//

import Foundation
import UIKit

class templateViewController:UIViewController {
    static let textArray = ["1-text","2-text","-text","-text","-text","-text","-text","-text"]
    
    static var index = 0
    
    let tip:UILabel = UILabel()
    
    let icon: UIButton = UIButton()
    
    let button: UIButton = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 244.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        tip.textColor = UIColor.gray
        
        tip.text = templateViewController.textArray[templateViewController.index]
        
        templateViewController.index = (templateViewController.index < templateViewController.textArray.count - 1) ? templateViewController.index + 1 : 0
        tip.numberOfLines = -1
        tip.textAlignment = .center
        icon.addTarget(self, action: #selector(templateViewController.homePageAction), for: .touchUpInside)
        
        button.setTitle(" click to pop or dismiss ", for: .normal)
        button.backgroundColor = self.view.backgroundColor
        button.layer.borderWidth = 2
        button.layer.backgroundColor = UIColor(white: 100/255.0, alpha: 1.0).cgColor
        button.setTitleColor(UIColor(white:100.0/255.0, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(templateViewController.backAction), for: .touchUpInside)
        
        view.addSubview(icon)
        view.addSubview(tip)
        view.addSubview(button)
    }
    @objc public func homePageAction() {
//        let vc = WebViewController.instanceFromStoryBoard()
//        vc.hidesBottomBarWhenPushed = true
//        if let navigationController = navigationController {
//            navigationController.pushViewController(vc, animated: true)
//            return
//        }
//        present(vc, animated: true, completion: nil)
    }
    @objc public func backAction() {
        if let navigationController = navigationController {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: true)
                return
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
