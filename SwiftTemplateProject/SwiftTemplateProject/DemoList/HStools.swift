//
//  HStools.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/18/20.
//

import Foundation


//MARK:-值类型判断
func judgeValueType(dic: AnyObject) -> String{
    if dic is NSMutableDictionary{
        return "NSMutableDictionary"
    }else if dic is NSDictionary{
        return "NSDictionary"
    }else if dic is NSArray{
        return "NSArray"
    }else if  dic is NSValue{
        return "NSValue"
    }else{
        return "\(dic)" //其他可能是字串类型
    }
}
/**
 读取数据
 Eg:
 key: userList
 dFilePath: userList.plist
 */
func loadData(key: String, dFilePath: String)-> NSDictionary{
    //判断.plist文件是否存在
    let fileManager = FileManager.default
    let isLocalDataExisted = fileManager.fileExists(atPath: dataFilePath(fileName: dFilePath))
    if isLocalDataExisted == false//文件不存在
    {
        fileManager.createFile(atPath: dataFilePath(fileName: dFilePath), contents: nil, attributes: nil)//创建.plist文件
    }
    let dicFromPList: NSDictionary? = NSDictionary(contentsOfFile: dataFilePath(fileName: dFilePath))
    print("文件 " + dFilePath + " 读取完成")
    return dicFromPList!
}
/**
 获取数据文件地址
 Eg:
 fileName:userList.plist
 */
func dataFilePath (fileName: String)->String{
    print(documentsDirectory().appending("/"+fileName))
    return documentsDirectory().appending( "/\(fileName)")
}
//获取沙盒文件夹路径
func documentsDirectory()->String {
    let paths = NSSearchPathForDirectoriesInDomains(
        FileManager.SearchPathDirectory.documentationDirectory,FileManager.SearchPathDomainMask.userDomainMask,true)
    let documentsDirectory:String = paths.first! as String
    return documentsDirectory
}
