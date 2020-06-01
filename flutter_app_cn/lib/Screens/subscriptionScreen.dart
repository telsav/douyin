import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/loginScreen.dart';

class Subscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 150.0, left: 65.0, right: 65.0),
      color: Color.fromRGBO(14, 15, 26, 1),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage("assets/images/int_1581491273221.png")),
            SizedBox(height: 20),
            Center(
              child: Text(
                '你还没有登录',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '登录账号，查看你关注的精彩内容',
                style: TextStyle(
                    color: Color.fromRGBO(253, 253, 253, 0.6),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Color.fromRGBO(252, 1, 86, 1),
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Scaffold.of(context)
                      .showBottomSheet<void>((BuildContext context) {
                    return Login();
                  });
                },
              ),
            ),
          ]),
    );
  }
}
