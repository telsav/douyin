import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_desktop/config/api.dart';
import 'package:flutter_desktop/models/Douyin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_desktop/Screens/videoScreen.dart';

class Trending extends StatefulWidget {
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  PageController pageController;
  BuildContext context;
  RequestController api = RequestController();
  List<Widget> videos = [];

  getTrending() async {
    //var cookies = await api.getCookie();
    //api.setCookie(cookies);
    try {
      var response = await http.get(
        api.url,
        headers: api.headers,
      );
      Douyin tiktok = Douyin.fromJson(jsonDecode(response.body));
      tiktok.billboardData.forEach(
        (item) {
          setState(() {
            getVideos(item);
            print(item.toJson());
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

  getVideos(BillboardData v) async {
    try {
      var url = v.link.split("/")[5];
      var response = await http.get(
        api.video + url + "&dytk",
        headers: api.headers,
      );
      VideoData videoData = VideoData.fromJson(jsonDecode(response.body));
      //获取无水印的视频地址
      api.getRedirects(videoData.itemList[0].video.playaddr.uri).then((url) => {
            url = url.replaceAll('&amp;', '&'),
            if (url != '')
              {
                videos.add(VideoItem(
                  data: videoData,
                  videourl: url,
                )),
                print(url),
              }
          });
    } catch (ex) {
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
