//
//  DemoSwiftLuhnVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/22/20.
//

import UIKit
import SwiftLuhn
class DemoSwiftLuhnVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = UIColor.white
        
        // Do any additional setup after loading the view.
        let cardNumber = "378282246310005"
        print("卡的类型"+cardNumber.cardType().debugDescription)
        print("卡片是否有效"+cardNumber.isValidCardNumber().description)
        print(cardNumber.suggestedCardType() ?? "")
        print(cardNumber.formattedCardNumber())
        
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
