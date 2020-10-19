//
//  MyObject.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/18/20.
//

import Foundation
class MyObject {
    @objc dynamic func sayHello(){
        print("Helloaass!")
    }
    
    
    @objc dynamic func sayHi(name: String) {
          print("Hi! \(name)")
    }
    
    @objc dynamic func sum(left: Int, right: Int) -> Int {
        return left + right
    }
}

