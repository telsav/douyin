import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class VideoDescription extends StatefulWidget {
  final String userName;
  final String description;
  final String musicName;
  final String authorName;

  const VideoDescription(
      {this.userName, this.description, this.musicName, this.authorName});

  @override
  VideoDescriptionState createState() => VideoDescriptionState();
}

class VideoDescriptionState extends State<VideoDescription>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  //Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    // _offsetAnimation = Tween<Offset>(
    //   begin: Offset.zero,
    //   end: const Offset(-2.0, 0.0),
    // ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        //height: 150.0,
        padding: EdgeInsets.only(left: 20.0, right: 100.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                '@${widget.userName}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${widget.description}',
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            Row(children: [
              Icon(Icons.music_note, size: 15.0, color: Colors.white),
              Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                width: 150,
                child: Marquee(
                  child: Text('${widget.musicName} - ${widget.authorName}'),
                  direction: Axis.horizontal,
                  textDirection: TextDirection.ltr,
                  animationDuration: Duration(seconds: 1),
                  directionMarguee: DirectionMarguee.oneDirection,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
