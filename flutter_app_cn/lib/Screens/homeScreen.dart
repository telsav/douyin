import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/trendingScreen.dart';
import 'package:flutter_app/widgets/bottom_toolbar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            print('Index: ' + index.toString());
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: bottomItems(currentIndex, pageController),
    );
  }
}
