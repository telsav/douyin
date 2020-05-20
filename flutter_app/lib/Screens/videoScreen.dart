import 'package:flutter/material.dart';
import 'package:flutter_app/models/Tiktok.dart';
import 'package:flutter_app/widgets/video_description.dart';
import 'package:flutter_app/widgets/actions_toolbar.dart';
import 'package:flutter_app/widgets/player.dart';

class VideoItem extends StatelessWidget {
  final ItemListData data;
  const VideoItem({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DouyinVideoPlayer(
            url: data.itemInfos.video.urls[0],
          ),
          title(),
          VideoDescription(
            description: data.itemInfos.text,
            musicName: data.musicInfos.musicName,
            authorName: data.musicInfos.authorName,
            userName: data.authorInfos.uniqueId,
          ),
          ActionsToolbar(
            comments: data.itemInfos.commentCount.toString(),
            userImg: data.authorInfos.covers[0],
            favorite: data.itemInfos.diggCount,
            coverImg: data.musicInfos.covers[0],
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
            "Trending | For You",
            style: TextStyle(color: Colors.white, fontSize: 19.0),
          ),
        ),
      );
}
