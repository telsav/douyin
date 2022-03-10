# 使用 Flutter 模仿抖音国外版, 本项目持续更新

### 开源不易，麻烦给个 Star★ 吧(☺️ 右上角点击 ★Star，轻轻松松，一秒钟 🤣)！我会根据大家的关注度和个人时间持续更新代码！

# 新项目位置:https://github.com/telsacoin/telsavideo 后台采用SpringCloud +IPFS存储+BSC链

## 版本

- 抖音国际版
- 抖音国内手机版
- 抖音国内桌面版

![抖音截图](douyin4.gif)

## Tasks

- [x] 视频上下播放
- [x] 数据显示正常
- [ ] 评论
- [ ] 搜索
- [ ] 聊天
- [ ] 点赞
- [ ] 分享

## Installation

Use the package manager [Flutter](https://flutter.dev/) to install foobar.

```bash
Invoke View > Command Palette.
Type "flutter", and select the Flutter: New Project.
Enter a project name, such as myapp, and press Enter.
Create or select the parent directory for the new project folder.
Wait for project creation to complete and the main.dart file to appear.
```

## Usage

```dart
class HomeState extends State<Home> {
  int currentIndex = 0;
  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Trending(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: bottomItems(currentIndex, pageController),
    );
  }
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Reference
[url]Flutter Tiktok Ui with TikTok unofficial Api
