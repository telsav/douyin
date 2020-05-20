# 使用Flutter模仿抖音国外版

flutte_app is a Flutter library for dealing with douyin app.

![抖音截图](douyin.gif)

## Installation

Use the package manager [Flutter](https://flutter.dev/) to install foobar.

```bash
Invoke View > Command Palette.
Type “flutter”, and select the Flutter: New Project.
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
