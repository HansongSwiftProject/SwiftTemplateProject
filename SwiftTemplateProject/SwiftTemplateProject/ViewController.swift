//
//  ViewController.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(UseRxSwiftVC.init(), animated: true) {
            
        }
    }

}

