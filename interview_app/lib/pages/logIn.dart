import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interview_app/pages/loggerPageRedirection.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';
import 'package:interview_app/reusable_code_blocks/validation_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:interview_app/pages/forgotPassword.dart';
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';
import 'package:interview_app/pages/dashBoard.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool checker = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
 void initState() {
    getValidationData().whenComplete(
      () async {
      
       if( checker == true){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoggerPageRedirection(),
                  ),
                );
       }
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
  Future login(BuildContext context) async {
    var url = Uri.http(SERVER_URL, "interview_app_phpfiles/login.php");
    var response = await http.post(url, body: {
      "emailId": emailId.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("isLoggedIn", true);
      print(preferences.getBool("isLoggedIn"));
      preferences.setString("loggedInEmailId", emailId.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      );
    } else {
      defaultSnackbar(context,'Username or password invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    void Function()? logInValidationFunction = () {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      login(context);
    };
    Form signInForm() {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            defaultTextField(context, 'Email ID', Icon(Icons.person), emailId,
                false, emailSignInValidator(), true),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.lightBlue[50],
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: password,
                      validator: passwordSignInValidator(),
                      enabled: true,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
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
                ],
              ),
            ),
            defaultButton('Sign In', width, logInValidationFunction),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: defaultPageOne(
        context,
        "Sign In",
        signInForm(),
        defaultSignUpWidget(context),
      ),
    );
  }
}
