import 'dart:convert';
import 'package:interview_app/logger_controller.dart';
import 'package:interview_app/reusable-UI-widgets/clickable_text.dart';
import 'package:interview_app/reusable-UI-widgets/strut_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'forgotPassword.dart';
import 'package:interview_app/gobalConstants.dart';
import 'register.dart';
import 'package:http/http.dart' as http;
import 'dashBoard.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailid = TextEditingController();
  TextEditingController password = TextEditingController();
  // bool emailIdValidity = true;
  // bool passwordValidity = true;
  // String? emailIdErrorMessage;
  // String? passwordErrorMessage;
  Future login(BuildContext context) async {
  
    var url = Uri.http(SERVER_URL, "interview_app_phpfiles/login.php");
    var response = await http.post(url, body: {
      "emailid": emailid.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
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
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
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
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    // bool validatorFun(){if (emailid.text == "") {
    //   emailIdValidity = false;
    //   emailIdErrorMessage = "Please enter the email address";
    //   return false;
    // } else {
    //   emailIdValidity = true;
    //   emailIdErrorMessage = null;
    // }

    // if (password.text == "") {
    //   passwordValidity = false;
    //   passwordErrorMessage = "Please enter the password";
    //   return false;
    // } else {
    //   passwordValidity = true;
    //   passwordErrorMessage = null;
    // }
    // return true;
    // }
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
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 25),
            defaultTextField(context, 'EmailID', Icon(Icons.person), emailid,
                false, (value) {
  if (value.isEmpty) {
    return "Enter valid Email ID";
  } else
    return null;
}),
            defaultTextField(context, 'Password', Icon(Icons.lock), password,
                true, (value) {
  if (value.isEmpty) {
    return "Enter valid password";
  } else
    return null;
}),
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
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
   return;
  }
                    },
                  ),
                )),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: defaultSignUpWidget(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
