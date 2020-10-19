#  SwiftMesh

基于Alamofire和Codable的二次封装，更加方便的使用。涉及到的设计模式有：适配器，单例，抽象等等

## MeshManager 
单例
* 获取网络状态 —isReachableWiFi、isReachableWWAN
* 是否联网 —isReachable
* 设置默认参数 —setDefaultParameters
* 默认header —setGlobalHeaders
* 是否打印日志 —canLogging
* 取消/清空请求 -cancelRequest/cancelAllRequest
* 上传/下载/普通请求 - - 所有请求都通过配置文件方式传递参数以及请求结果，通过闭包设置配置文件的属性即可，详情参看配置文件注释，用法参照MeshRequest。
MeshConfig
* 网络请求的配置文件，用于设置
请求超时时间、
请求方式，
参数，
header，
API地址，
上传用的表单
等等，
MeshRequest
```
MeshRequest<TestModel>.get(“https://api.apiopen.top/getJoke?page=1&count=2&type=video”) { (model) in
           print(model!)
       }
```
