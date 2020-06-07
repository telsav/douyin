import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:video_player/video_player.dart';

class DouyinVideoPlayer extends StatefulWidget {
  final String url;
  const DouyinVideoPlayer({this.url});
  @override
  State<StatefulWidget> createState() => _DouyinVideoPlayerState();
}

class _DouyinVideoPlayerState extends State<DouyinVideoPlayer> {
  VideoPlayerController _controller;
  //Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      alignment: Alignment.center,
      color: Colors.black,
      //height: double.infinity,
      child: _controller.value.initialized
          ? GestureDetector(
              onTap: () {
                print(_controller.value.aspectRatio);
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              },
              child: AspectRatio(
                aspectRatio: 0.656, //_controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              ),
            )
          : loadingVideo(),
    );
  }

  Widget loadingVideo() => Container(
        color: Colors.black,
        child: Center(
          child: GFLoader(
            type: GFLoaderType.circle,
            loaderColorOne: Colors.blueAccent,
            loaderColorTwo: Colors.black,
            loaderColorThree: Colors.pink,
          ),
        ),
      );
}
