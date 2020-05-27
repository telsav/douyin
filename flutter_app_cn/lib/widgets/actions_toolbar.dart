import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_app/common/icons.dart';

class ActionsToolbar extends StatefulWidget {
  final int favorite;
  final String comments;
  final String userImg;
  final String coverImg;

  const ActionsToolbar(
      {Key key, this.favorite, this.comments, this.userImg, this.coverImg});

  @override
  State<StatefulWidget> createState() => new _ActionsToolbarState();
}

class _ActionsToolbarState extends State<ActionsToolbar>
    with SingleTickerProviderStateMixin {
  static const double ActionWidgetSize = 60.0;
  static const double ActionIconSize = 35.0;
  static const double ShareActionIconSize = 25.0;
  static const double ProfileImageSize = 50.0;
  static const double PlusIconSize = 20.0;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animationController.repeat();
  }

  stopRotation() {
    animationController.stop();
  }

  startRotation() {
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: double.parse(widget.favorite.toString()));

    FlutterMoneyFormatter fmf2 =
        FlutterMoneyFormatter(amount: double.parse(widget.comments));

    return Align(
        alignment: Alignment.bottomRight,
        widthFactor: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getFollowAction(),
            _getSocialAction(
                icon: DouyinIcons.heart,
                title: '${fmf.output.compactNonSymbol}'),
            _getSocialAction(
                icon: DouyinIcons.chat_bubble,
                title: '${fmf2.output.compactNonSymbol}'),
            _getSocialAction(
                icon: DouyinIcons.reply, title: '分享', isShare: true),
            _getMusicPlayerAction()
          ],
        ));
  }

  Widget _getSocialAction({String title, IconData icon, bool isShare = false}) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon,
              size: isShare ? ShareActionIconSize : ActionIconSize,
              color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child:
                Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),
          )
        ]));
  }

  Widget _getFollowAction({String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Stack(children: [_getProfilePicture(), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
          width: PlusIconSize, // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(15.0)),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: PlusIconSize,
          )),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
        left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
        child: Container(
            //padding:EdgeInsets.all(1.0), // Add 1.0 point padding to create border
            height: ProfileImageSize, // ProfileImageSize = 50.0;
            width: ProfileImageSize, // ProfileImageSize = 50.0;
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
              image: DecorationImage(
                  image: NetworkImage(
                    widget.userImg,
                  ),
                  fit: BoxFit.cover),
            )));
  }

  LinearGradient get musicGradient => LinearGradient(colors: [
        Colors.grey[800],
        Colors.grey[900],
        Colors.grey[900],
        Colors.grey[800]
      ], stops: [
        0.0,
        0.4,
        0.6,
        1.0
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction() {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.black54,
            ),
            padding: EdgeInsets.all(11.0),
            height: ProfileImageSize,
            width: ProfileImageSize,
            child: AnimatedBuilder(
              animation: animationController,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: musicGradient,
                  //border: Border.all(color: Colors.black87, width: 11.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.coverImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              builder: (BuildContext context, Widget _widget) {
                return Transform.rotate(
                  angle: animationController.value * 6.3,
                  child: _widget,
                );
              },
            ),

            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   gradient: musicGradient,
            //   border: Border.all(color: Colors.black87, width: 11.0),
            //   image: DecorationImage(
            //     image: NetworkImage(widget.coverImg),
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
        ]));
  }
}
