import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:interview_app/pages/logIn.dart';
import 'package:interview_app/gobalConstants.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/reusable_code_blocks/clickable_text.dart';
import 'register.dart';
class LogOutSuccess extends StatefulWidget {
  @override
  _LogOutSuccessState createState() => _LogOutSuccessState();
   
}

class _LogOutSuccessState extends State<LogOutSuccess> {
 
  @override
  Widget build(BuildContext context) {
    Future<dynamic> signInNav(){return  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogIn(),
                        ),
                      );}
    return Scaffold(
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
                'Success!',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( 
                'Loggedout successfully',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),
            ),
            SizedBox(height: 25),
         
                MaterialButton(
                  onPressed: () => {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogIn(),
                        ),
                      );
                    },
                    child: clickToSignInText(),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}