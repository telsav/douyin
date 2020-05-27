import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class RequestController {
  //static String host = "https://www.tiktok.com/";
  static String host = "https://creator.douyin.com";
  String url = host + "/aweme/v1/creator/data/billboard/?billboard_type=4";

  String video =
      "https://www.iesdouyin.com/web/api/v2/aweme/iteminfo/?item_ids=";

  String player = "https://aweme.snssdk.com/aweme/v1/play/?video_id=";

  Future<String> getVideos() async {
    try {
      var response = await http.get(url);
      return response.body;
    } catch (e) {
      return e.toString();
    }
  }

  //获取无水印的视频
  Future<String> getRedirects(String videoid) async {
    try {
      var response = await new Dio().get(
        player +
            videoid +
            "&ratio=720p&line=0&media_type=4&vr_type=0&improve_bitrate=0&is_play_url=1&h265=1&adapt720=1",
        options: Options(
            headers: headers,
            contentType: "text/html; charset=utf-8",
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      if (response.statusCode == 302) {
        return response.data.toString().split('"')[1];
      }
      return '';
    } catch (ex) {
      return '';
    }
  }

  Future<String> getCookie() async {
    try {
      var response = await http.get(host + "/share/item/");
      return response.headers["set-cookie"];
    } catch (e) {
      return "error";
    }
  }

  var headers = {
    "user-agent":
        "Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1"
  };
}
