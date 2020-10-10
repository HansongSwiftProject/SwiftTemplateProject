//
//  CaptionsViewController.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/10/20.
//

import Capable
import UIKit

class CaptionsViewController: UIViewController {
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var content: UIView!
    @IBOutlet var topLeftLabel: UILabel!
    @IBOutlet var topCenterLabel: UILabel!
    @IBOutlet var topRightLabel: UILabel!
    @IBOutlet var centerLeftLabel: UILabel!
    @IBOutlet var centerLabel: UILabel!
    @IBOutlet var centerRightLabel: UILabel!
    @IBOutlet var bottomLeftLabel: UILabel!
    @IBOutlet var bottomCenterLabel: UILabel!
    @IBOutlet var bottomRightLabel: UILabel!
    var isLoading: Bool = true {
        didSet {
            DispatchQueue.main.async {
                self.content.isHidden = self.isLoading

                if self.isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelColors()
    }
    private func setupLabelColors() {
        let backgroundImage = UIImage(named: "captions_gradient")!
        let labels: [UILabel: ImageArea] = [
            topLeftLabel: .topLeft,
            topCenterLabel: .topCenter,
            topRightLabel: .topRight,
            centerLeftLabel: .centerLeft,
            centerLabel: .center,
            centerRightLabel: .centerRight,
            bottomLeftLabel: .bottomLeft,
            bottomCenterLabel: .bottomCenter,
            bottomRightLabel: .bottomRight,
        ]

        isLoading = true
        DispatchQueue.global(qos: .background).async {
            for label in labels {
                let textColor = UIColor.getTextColor(onBackgroundImage: backgroundImage, imageArea: label.value)

                DispatchQueue.main.async {
                    label.key.textColor = textColor
                }
            }
            self.isLoading = false
        }
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
