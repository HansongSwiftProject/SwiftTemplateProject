#  SwiftGifOrigin
[请参考](https://github.com/HansongSwiftPro)


# Gifu 使用

[请参考](https://github.com/HansongSwiftProject/Gifu)

* 下面是总结
```
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
```
