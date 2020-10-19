#  隐藏底部导航条 ｜ 隐藏顶部导航条


#[参考](https://www.jianshu.com/p/aa61c05c3b90)
* 代码设置
```
let viewController = SecondViewController()
viewController.hidesBottomBarWhenPushed = true
self.navigationController?.pushViewController(viewController, animated: true)
```
* 故事版中设置
Hide Bottom Bar on Push

# er
