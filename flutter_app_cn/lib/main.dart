// ADD THIS IMPORT
//import 'package:flutter/foundation.dart'
//    show debugDefaultTargetPlatformOverride;
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/homeScreen.dart';
//import 'package:flutter_app/common/custom_proxy.dart';

// void main() async {
//   if (!kReleaseMode) {
//     //final proxy = CustomProxy(ipAddress: "localhost", port: 8087);
//     //proxy.enable();
//   }
//   // ADD THIS LINE
//   debugDefaultTargetPlatformOverride = TargetPlatform.windows;
//   runApp(MyApp());
// }

Future<Null> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
      //final proxy = CustomProxy(ipAddress: "localhost", port: 8087);
      //proxy.enable();
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<Null>>(() async {
    // ADD THIS LINE
    //debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('{$error $stackTrace}');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        //visualDensity: VisualDensity.adaptivePlatformDensity,
        //fontFamily: "Poppins",
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: Home(),
    );
  }
}
