#  CocoaDebug
使用方法如下
# 引入
```
#if DEBUG
    import CocoaDebug
#endif

```

# 调用
```
#if DEBUG
    //If Use Google's Protocol buffers
    CocoaDebug.protobufTransferMap = [
                                     "your_api_keywords_1": ["your_request_protobuf_className_1", "your_response_protobuf_className_1"],
                                     "your_api_keywords_2": ["your_request_protobuf_className_2", "your_response_protobuf_className_2"],
                                     "your_api_keywords_3": ["your_request_protobuf_className_3", "your_response_protobuf_className_3"]
                                     ]
    CocoaDebug.enable()
#endif
```
