//
//  DemoGifVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/22/20.
//

import UIKit
import Gifu
class DemoGifVC: UIViewController {

    @IBOutlet weak var imageView: GIFImageView!
    var currentGIFName: String =  "mugen"  {
      didSet {
        self.animate()
      }
    }
    override func viewWillDisappear(_ animated: Bool) {
      imageView.prepareForReuse()
    }
    override func viewDidAppear(_ animated: Bool) {
      self.animate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func animate() {
      imageView.animate(withGIFNamed: currentGIFName, animationBlock:  {
      })
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
