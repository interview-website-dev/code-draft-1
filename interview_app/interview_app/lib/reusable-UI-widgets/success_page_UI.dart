import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:interview_app/pages/logIn.dart';
import 'package:interview_app/gobalConstants.dart';
import 'package:http/http.dart' as http;

class SuccessPageUI extends StatefulWidget {
  _SuccessPageUIState createState() => _SuccessPageUIState();
  final String mainText;
  final String subText;
  final Widget redirection;
  SuccessPageUI(
      {Key? key,
      required this.mainText,
      required this.subText,
      required this.redirection})
      : super(key: key);
}

class _SuccessPageUIState extends State<SuccessPageUI> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.white])),
        child: Column(
          children: <Widget>[
            SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/logo_final.png', width: 250),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.mainText,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.subText,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 25),
            MaterialButton(
              onPressed: () => {},
              child: widget.redirection,
            ),
          ],
        ),
      ),
    );
  }
}
