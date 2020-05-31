import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/loginScreen.dart';
import 'package:flutter_app/Screens/subscriptionScreen.dart';
import 'package:flutter_app/Screens/trendingScreen.dart';
//import 'package:flutter_app/widgets/bottom_toolbar.dart';
import 'package:flutter_app/common/icons.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController _tabController;
  PageController _pageController;

  final List<Tab> toptabs = <Tab>[
    Tab(
      child: Text('关注',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ),
    Tab(
      child: Text('推荐',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: toptabs.length, vsync: this)
      ..addListener(() {
        if (_tabController.indexIsChanging) {
          //判断TabBar是否切换
          print(_tabController.index);
          onPageChange(_tabController.index, p: _pageController);
        }
      });
    _tabController.animateTo(1); //默认推荐选项卡
    _pageController = new PageController(initialPage: 0, keepPage: true);
  }

  void onPageChange(int index, {PageController p, TabController t}) async {}

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Stack(
        //fit: StackFit.expand,
        children: <Widget>[
          TabBarView(
            controller: _tabController,
            children: <Widget>[
              Subscription(),
              PageView(
                allowImplicitScrolling: true,
                controller: _pageController,
                children: <Widget>[
                  Trending(),
                ],
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ],
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                    icon: Icon(Icons.tv),
                    onPressed: () {
                      print('点击了直播按钮');
                    }),
                actions: <Widget>[
                  //导航栏右侧菜单
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        print('点击了搜索按钮');
                      }),
                ],
                title: TabBar(
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0, color: Colors.white),
                      insets: EdgeInsets.symmetric(horizontal: 18.0)),
                  labelStyle: TextStyle(fontSize: 18),
                  isScrollable: true,
                  controller: _tabController,
                  tabs: toptabs,
                  onTap: (index) {
                    print(index);
                  },
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottomItems(),
    );
  }

  double createButtomWidth = 38.0;
  Widget get customCreateIcon => Container(
        width: 45.0,
        height: 27.0,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              width: createButtomWidth,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              width: createButtomWidth,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 32, 211, 234),
                  borderRadius: BorderRadius.circular(7.0)),
            ),
            Center(
              child: Container(
                height: double.infinity,
                width: createButtomWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0)),
                child: Icon(
                  Icons.add,
                  size: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );

  BottomNavigationBar bottomItems() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      elevation: 0.5,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
          print(index);
        });
        Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
          return Login();
        });
      },
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(DouyinIcons.home),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
            icon: Icon(DouyinIcons.search),
            title: SizedBox.shrink(),
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
          icon: customCreateIcon,
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(DouyinIcons.messages),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(DouyinIcons.profile),
          title: SizedBox.shrink(),
        ),
      ],
    );
  }
}
