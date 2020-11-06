//
//  DemoMoyaNetworkVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 11/5/20.
//

import UIKit
import Moya
class DemoMoyaNetworkVC: UIViewController {
    var progressView = UIView()
    var repos = NSArray()
    
    @IBAction func getRequest(_ sender: UIButton) {
//        get1("ashfurrow")
        get2()
    }
    @IBAction func postRequest(_ sender: UIButton) {
       
    }
    @IBAction func putRequest(_ sender: UIButton) {
        
    }
    @IBAction func headerRequest(_ sender: UIButton) {
        
    }
    @IBAction func uploadImageRequest(_ sender: UIButton) {
        giphyProvider.request(.upload(gif: Giphy.animatedBirdData),
                              callbackQueue: DispatchQueue.main,
                              progress: progressClosure,
                              completion: progressCompletionClosure)
    }
    @IBAction func downLoadImageRequest(_ sender: UIButton) {
        gitHubUserContentProvider.request(.downloadMoyaWebContent("logo_github.png"),
                                          callbackQueue: DispatchQueue.main,
                                          progress: progressClosure,
                                          completion: progressCompletionClosure)
    }
    @IBAction func uploadVideoRequest(_ sender: UIButton) {
        
    }
    @IBAction func downLoadVideoRequest(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.frame = CGRect(origin: .zero, size: CGSize(width: 0, height: 2))
        progressView.backgroundColor = .blue
        navigationController?.navigationBar.addSubview(progressView)
       
    }
    func get1(_ username: String) {
        gitHubProvider.request(.userRepositories(username)) { result in
            do {
                let response = try result.get()
                let value = try response.mapNSArray()
                self.repos = value
                print(self.repos)
            } catch {
                let printableError = error as CustomStringConvertible
                print(printableError)
            }
        }
    }
    func get2() {
        gitHubProvider.request(.userProfile("ashfurrow")) { result in
            do {
                let response = try result.get()
                let value = try response.mapNSDictionary()
                print(value["avatar_url"]!)
            } catch {
                let printableError = error as CustomStringConvertible
                print(printableError)
            }
        }
    }
    lazy var progressClosure: ProgressBlock = { response in
        UIView.animate(withDuration: 0.3) {
            self.progressView.frame.size.width = self.view.frame.size.width * CGFloat(response.progress)
        }
    }
    // MARK: - Progress Helpers
    lazy var progressCompletionClosure: Completion = { result in
        let color: UIColor
        switch result {
        case .success:
            color = .green
        case .failure:
            color = .red
        }

        UIView.animate(withDuration: 0.3) {
            self.progressView.backgroundColor = color
            self.progressView.frame.size.width = self.view.frame.size.width
        }

        UIView.animate(withDuration: 0.3, delay: 1, options: [],
                       animations: {
                        self.progressView.alpha = 0
        },
                       completion: { _ in
                        self.progressView.backgroundColor = .blue
                        self.progressView.frame.size.width = 0
                        self.progressView.alpha = 1
        }
        )

    }
}
