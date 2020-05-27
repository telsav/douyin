import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:video_player/video_player.dart';

class DouyinVideoPlayer extends StatefulWidget {
  final String url;
  const DouyinVideoPlayer({this.url});
  @override
  _DouyinVideoPlayerState createState() => _DouyinVideoPlayerState();
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
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.black,
      height: double.infinity,
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
                aspectRatio: 0.66, //_controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              ),
            )
          : loadingVideo(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Butterfly Video'),
    //   ),
    //   // Use a FutureBuilder to display a loading spinner while waiting for the
    //   // VideoPlayerController to finish initializing.
    //   body: FutureBuilder(
    //     future: _initializeVideoPlayerFuture,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         // If the VideoPlayerController has finished initialization, use
    //         // the data it provides to limit the aspect ratio of the video.
    //         return AspectRatio(
    //           aspectRatio: _controller.value.aspectRatio,
    //           // Use the VideoPlayer widget to display the video.
    //           child: VideoPlayer(_controller),
    //         );
    //       } else {
    //         // If the VideoPlayerController is still initializing, show a
    //         // loading spinner.
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     },
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       // Wrap the play or pause in a call to `setState`. This ensures the
    //       // correct icon is shown.
    //       setState(() {
    //         // If the video is playing, pause it.
    //         if (_controller.value.isPlaying) {
    //           _controller.pause();
    //         } else {
    //           // If the video is paused, play it.
    //           _controller.play();
    //         }
    //       });
    //     },
    //     // Display the correct icon depending on the state of the player.
    //     child: Icon(
    //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //     ),
    //   ),
    //   // This trailing comma makes auto-formatting nicer for build methods.
    // );
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
