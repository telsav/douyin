import 'package:flutter/material.dart';
import 'package:flutter_app/models/Douyin.dart';
import 'package:flutter_app/widgets/video_description.dart';
import 'package:flutter_app/widgets/actions_toolbar.dart';
import 'package:flutter_app/widgets/player.dart';

class VideoItem extends StatelessWidget {
  final VideoData data;
  final String videourl;
  const VideoItem({@required this.data, this.videourl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DouyinVideoPlayer(
            url: videourl,
          ),
          title(),
          VideoDescription(
            description: data.itemList[0].textExtras[0].hashtagName,
            musicName: data.itemList[0].music.title,
            authorName: data.itemList[0].music.author,
            userName: data.itemList[0].author.nickname,
          ),
          ActionsToolbar(
            comments: data.itemList[0].statistics.commentCount.toString(),
            userImg: data.itemList[0].author.avatarMedium.urlList[0],
            favorite: data.itemList[0].statistics.diggCount,
            coverImg: data.itemList[0].music.covermedium.urlList[0],
          ),
        ],
      ),
    );
  }

  Widget title() => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0),
          child: Text(
            "关注 | 推荐",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      );
}
