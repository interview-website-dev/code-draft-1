import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'forgotPassword.dart';
import 'gobalConstants.dart';
import 'register.dart';
import 'package:http/http.dart' as http;
import 'dashBoard.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailid = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(BuildContext context) async {
    var url = SERVER_URL + "/interview_app_phpfiles/login.php";
    var response = await http.post(url, body: {
      "emailid": emailid.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Login successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      );
    } else {
      _showSnackbar(context);
    }
  }

  void _showSnackbar(BuildContext context) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        'Username or password invalid',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      duration: Duration(seconds: 5),
    ));
  }

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
                'Sign In',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.lightBlue[50],
                  labelText: 'EmailID',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: emailid,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.lightBlue[50],
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: password,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Container(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: Text("forgot Password?"),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(40, 8, 40, 0),
                child: ButtonTheme(
                  minWidth: width,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      login(context);
                    },
                  ),
                )),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: MaterialButton(
                  onPressed: () => {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
