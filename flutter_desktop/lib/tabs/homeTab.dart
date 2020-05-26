import 'package:flutter/material.dart';
import "package:flutter_desktop/widgets/bottom_toolbar.dart";

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: bottomItems(null, null),
    );
  }
}
