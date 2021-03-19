import 'package:flutter/material.dart';
import 'package:interview_app/reusable-UI-widgets/strut_widgets.dart';
import 'package:interview_app/reusable-UI-widgets/validation_functions.dart';
import 'dart:convert';
import 'changePassword.dart';
import 'package:interview_app/gobalConstants.dart';
import 'package:http/http.dart' as http;
import 'dashBoard.dart';
import 'register.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  ValidationRequiredValues? validationRequiredValues;
  TextEditingController emailid = TextEditingController();

  get value => null;

  Future forgotPassProcess(context) async {
    var url =
        Uri.http(SERVER_URL, "interview_app_phpfiles/forgot_password.php");
    ;
    var response = await http.post(url, body: {
      "emailid": emailid.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangePassword(
            emailId: emailid.text,
          ),
        ),
      );
    } else {
      _showSnackbar(context);
    }
  }

  void _showSnackbar(BuildContext context) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(
        'Username invalid',
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
                'Forgot Password',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.lightBlue[50],
                    //       labelText: 'EmailID',
                    //       prefixIcon: Icon(Icons.person),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8)),
                    //     ),
                    //     controller: emailid,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'EmailID cannot be empty';
                    //       }
                    //     },
                    //   ),
                    // ),
                    defaultTextField(context, 'EmailID', Icon(Icons.person), emailid, false, emailValidator, true),
                    Container(
                        margin: EdgeInsets.fromLTRB(40, 8, 40, 0),
                        child: ButtonTheme(
                          minWidth: width,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Change Password',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              forgotPassProcess(context);
                            },
                          ),
                        )),
                  ]),
            ),
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
