//
//  DemoTableViewController.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/18/20.
//

import UIKit

class DemoTableViewController: UITableViewController {
    var objects: [String:[String]?]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let diaryList = Bundle.main.path(forResource: "Demolist", ofType: "plist")
        objects = NSDictionary(contentsOfFile: diaryList!) as? [String : [String]?]
//        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = false
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return objects?.keys.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keyA = [String]((objects?.keys)!)
        let index = objects?.index(forKey: keyA[section])
        let  arrV = objects?[index!].value
        return arrV?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let airportCodes = [String]((objects?.keys)!)
        return airportCodes[section]
    }
    static let cellID = "DemocellID"
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: DemoTableViewController.cellID)
        let keyA = [String]((objects?.keys)!)
        let index = objects?.index(forKey: keyA[indexPath.section])
        let  arrV:[String]? = objects?[index!].value
        cell.textLabel?.text  = (arrV?[indexPath.row] ?? "读取数据失败") as String
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keyA = [String]((objects?.keys)!)
        let index = objects?.index(forKey: keyA[indexPath.section])
        let  arrV:[String]? = objects?[index!].value
        arrV?[indexPath.row]
        switch  arrV?[indexPath.row] {
        case "NotificationBannerSwift":
            classSectionSkip_NotificationBannerSwift()
        case "Hook":
            classSectionSkip_DemoHookVC()
        case "SwiftMesh":
            classSectionSkip_DemoNetWorkVC()
        default:
            break
        }
    }
    

    func classSectionSkip_NotificationBannerSwift(){
        if navigationController == nil {
            fatalError("navigation不存在")
        }
        //FIXME: DemoNotificationBannerSwiftVC 无法用xib加载视图的原因,以及解决办法
        let demo = DemoNotificationBannerSwiftVC()
        demo.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(demo, animated: true)
        navigationController?.hidesBottomBarWhenPushed = true;
    }
    func classSectionSkip_DemoHookVC(){
        if navigationController == nil {
            fatalError("navigation不存在")
        }
      let demo =  DemoHookVC()
        demo.hidesBottomBarWhenPushed = true
        navigationController?.hidesBarsWhenVerticallyCompact = true;
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(demo, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    func classSectionSkip_DemoNetWorkVC(){
        //MARK: 用Xib做视图渲染，避免之前隐藏了navibar，子页面轻点有会出现navibar
        let demo =  DemoNetWorkVC.init(nibName: "DemoNetWorkVC", bundle: Bundle.main)
        demo.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(demo, animated: true)
    }

}
