import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_app/config/api.dart';
import 'package:flutter_app/models/Tiktok.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/Screens/videoScreen.dart';

class Trending extends StatefulWidget {
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  PageController pageController;
  BuildContext context;
  RequestController api = RequestController();
  List<Widget> videos = [];

  getTrending() async {
    var cookies = await api.getCookie();
    api.setCookie(cookies);
    try {
      var response = await http.get(
        api.url,
        headers: api.headers,
      );
      Tiktok tiktok = Tiktok.fromJson(jsonDecode(response.body));
      tiktok.body.itemListData.forEach(
        (item) {
          setState(() {
            videos.add(VideoItem(data: item));
          });
        },
      );
    } catch (ex) {
      SimpleDialog(
        title: Text('Hot videos list is empty'),
      );
      print(ex);
    }
  }

  @override
  void initState() {
    super.initState();
    getTrending();
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: videos.length == 0
          ? <Widget>[
              Container(
                color: Colors.black,
                child: Center(
                  child: GFLoader(
                    type: GFLoaderType.circle,
                    loaderColorOne: Colors.blueAccent,
                    loaderColorTwo: Colors.white,
                    loaderColorThree: Colors.pink,
                  ),
                ),
              )
            ]
          : videos,
    );
  }
}
