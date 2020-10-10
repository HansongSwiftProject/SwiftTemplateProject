//
//  UseRxSwiftVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/10/20.
//

import UIKit
import RxCocoa
import RxSwift
class UseRxSwiftVC: UIViewController {
    var button:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        button = UIButton.init()
        button?.frame = CGRect.init(x: 10, y: 10, width: 100, height: 100)
        button?.backgroundColor = UIColor.red
        button?.rx.tap.subscribe(onNext: { (_) in
            print("ABC")
        }, onError: { (_) in
            print("ABE")
        }, onCompleted: {
            print("ABD")
        }, onDisposed: {
            print("ABF")
        })
        button?.setTitle("ABC", for: UIControl.State.normal)
        
        view.addSubview(button!)
        
        
    }
  
}
