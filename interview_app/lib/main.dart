import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_app/logger_controller.dart';
import 'package:interview_app/pages/dashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:interview_app/pages/logIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
bool? checker;
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2),
          () => checker == false ?  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(),
        ),
      ) :  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      ));
    });
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences preferences =
        await SharedPreferences.getInstance();
    var obtainedBool = preferences.getBool("isLoggedIn") ?? false;
    setState(() {
      checker = obtainedBool;
    });
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
          CircleAvatar(
            child: Icon(Icons.local_activity),
            radius: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    ));
  }
}
