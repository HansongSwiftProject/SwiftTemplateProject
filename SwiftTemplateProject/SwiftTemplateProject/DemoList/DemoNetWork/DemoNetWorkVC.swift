//
//  DemoNetWorkVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/19/20.
//

import UIKit
import SwiftMesh
//
struct BaseModel:Codable {
    let body:String
    let title:String
    let userId:Int
}
struct TestModel:Codable {
    let code:Int
    let message:Int
    let result:[Item]
}
struct Item:Codable {
    let text:String
    let video:String
}
//struct ResultModel:Codable {
//    let city:String
//    let citykey:String
//    let parent:String
//    let updateTime:String
//}
struct ResultModel:Codable {
    let date:String
    let high:String
    let low:String
    let ymd:String
    let week:String
    let sunrise:String
    let sunset:String
    let aqi:Int
    let fx:String
    let fl:String
    let type:String
    let notice:String
}
struct VideoListModel:Codable {
    let total:Int8
    let list:[VideoInfoModel]
}
struct VideoInfoModel:Codable {
    let author:String
    let authorId:String
    let commentNum:Int8
    let headImage:String
    let playNum:Int
    let praiseNum:Int
    let publishTime:String
    let videoId:String
    let videoIdcUrl:String
    let videoImg:String
    let videoSize:String
//    let videoTime:Int8
    let videoTitle:String
    let videoSort:Bool


    let isPraise:Int8
    let isAttention:Int8
//    let mkCustomtype:Int8
////    var nextLinkUrl:String?
    let areSelf:Bool
//    let videoStatus:Int8
    let isVip:Bool
    
}
class DemoNetWorkVC: UIViewController {

    
    class func setHeader() {
        MeshManager.shared.setGlobalHeaders(["aaa":"bbb"])
        MeshManager.shared.setDefaultParameters(["String":"Any","a":"1","b":"2"])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        MeshManager.shared.canLogging = true
        
        
    }

    @IBAction func getRequest(_ sender: UIButton) {
        
//        MeshRequest.get("http://t.weather.itboy.net/api/weather/city/101030100", modelType:ResultModel.self,modelKeyPath:"cityInfo") { (model) in
//            print("2222\(String(describing:model))")
//        }
        MeshRequest.get("http://t.weather.itboy.net/api/weather/city/101030100", modelType:[ResultModel].self,modelKeyPath:"data.forecast") { (model) in
            print("2222\(String(describing:model?.last))")
        }
  
    }
    
    @IBAction func postRequest(_ sender: UIButton) {
        //http://172.24.135.204:8011/app/videos/recommendVideos?pageSize=10&pageNum=1
      MeshRequest.post("http://172.24.135.204:8011/app/videos/recommendVideos", parameters: ["pageNum":(1),"pageSize":(10)], modelType:[VideoInfoModel].self, modelKeyPath: "data.list") { (model) in
        print("3333\(String(describing:model?.first))")
        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
//            a?.cancel()
//        }
    }
    
    @IBAction func uploadRequest(_ sender: UIButton) {
        
    }
    
    @IBAction func downloadRequest(_ sender: UIButton) {
        
    }
    
    @IBAction func soapRequest(_ sender: UIButton) {
        
    }
    
    @IBAction func TcpRequest(_ sender: UIButton) {
        
    }
    
    @IBAction func uploadStreamRequest(_ sender: UIButton) {
        
    }
    
    @IBAction func downloadStreamRequest(_ sender: UIButton) {
        
    }
}
