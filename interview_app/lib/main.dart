import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:interview_app/pages/dashBoard.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';
import 'package:interview_app/pages/logIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// The root widget of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'interview_app',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? checker;
  @override
  void initState() {
    getValidationData().whenComplete(
      () async {
        Timer(
          Duration(seconds: 2),
          () => checker == false
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ),
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoard(),
                  ),
                ),
        );
      },
    );
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedBool = preferences.getBool("isLoggedIn") ?? false;
    setState(
      () {
        checker = obtainedBool;
      },
    );
    print(checker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            freeFloatingLogo(),
          ],
        ),
      ),
    );
  }
}
