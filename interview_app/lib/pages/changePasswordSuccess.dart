import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:interview_app/pages/logIn.dart';
import 'package:interview_app/gobalConstants.dart';
import 'package:http/http.dart' as http;
import 'register.dart';
class ChangePasswordSuccess extends StatefulWidget {
  @override
  _ChangePasswordSuccessState createState() => _ChangePasswordSuccessState();
   
}

class _ChangePasswordSuccessState extends State<ChangePasswordSuccess> {
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

      /* appBar: AppBar(
       
        title: Image.asset('assets/images/logo_final.png', width:180,alignment: Alignment.centerLeft,),  
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.white
      ),*/
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
                'Changed password successfully',
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
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Click ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "here ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
                          ),
                           Text(
                            "to sign in",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ]),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}