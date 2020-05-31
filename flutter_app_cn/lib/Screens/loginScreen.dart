import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TapGestureRecognizer _myTapGestureRecognizer;
  @override
  void initState() {
    super.initState();
    _myTapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        launch('https://open.douyin.com/platform');
      };
  }

  @override
  void dispose() {
    _myTapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:
          EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
              ),
              Text('帮助', style: TextStyle(color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 150.0,
          ),
          Center(
            child: Text('180****2520',
                style: TextStyle(color: Colors.black, fontSize: 38)),
          ),
          Center(
            child: Text('认证服务由中国电信提供',
                style: TextStyle(
                    color: Color.fromRGBO(53, 53, 53, 1), fontSize: 12)),
          ),
          SizedBox(
            height: 50.0,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              color: Color.fromRGBO(252, 1, 86, 1),
              child: Text(
                '本机号码一键登录',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showBottomSheet(
                    context: context, builder: (context) => Login());
              },
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlineButton(
              color: Color.fromRGBO(252, 1, 86, 1),
              child: Text(
                '其他手机号码登录',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                showBottomSheet(
                    context: context, builder: (context) => Login());
              },
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
              child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '登录即表明同意',
                  style: TextStyle(color: Color.fromRGBO(53, 53, 53, 0.8)),
                ),
                TextSpan(text: '  '),
                TextSpan(
                  text: '用户协议',
                  style: TextStyle(color: Color.fromRGBO(0, 164, 219, 0.8)),
                ),
                TextSpan(text: '  '),
                TextSpan(
                  text: '和',
                  style: TextStyle(color: Color.fromRGBO(53, 53, 53, 0.8)),
                ),
                TextSpan(text: '  '),
                TextSpan(
                  text: '隐私政策',
                  style: TextStyle(color: Color.fromRGBO(0, 164, 219, 0.8)),
                ),
              ],
            ),
          )),
          Center(
              child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '以及',
                  style: TextStyle(color: Color.fromRGBO(53, 53, 53, 0.8)),
                ),
                TextSpan(text: '  '),
                TextSpan(
                    text: '《中国电信认证服务条款》',
                    style: TextStyle(color: Color.fromRGBO(0, 164, 219, 0.8)),
                    recognizer: _myTapGestureRecognizer),
              ],
            ),
          )),
          Expanded(
              flex: 1,
              child: Center(
                  heightFactor: 25.0,
                  child: Text('其他方式登录',
                      style:
                          TextStyle(color: Color.fromRGBO(0, 164, 219, 0.8))))),
        ],
      ),
    );
  }
}
