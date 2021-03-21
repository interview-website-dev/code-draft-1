import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:interview_app/pages/changePasswordSuccess.dart';
import 'package:interview_app/errorPage.dart';
import 'package:interview_app/pages/logIn.dart';
import 'package:interview_app/gobalConstants.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';
import 'package:interview_app/reusable_code_blocks/validation_functions.dart';
import 'package:interview_app/utils/mailSender.dart';
import 'register.dart';

class ChangePassword extends StatefulWidget {
  final String emailId;
  ChangePassword({Key? key, required this.emailId}) : super(key: key);
  @override
  _ChangePasswordState createState() => _ChangePasswordState(emailId: emailId);
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class _ChangePasswordState extends State<ChangePassword> {
  // In the constructor, require a Todo.
  String? emailId;
  _ChangePasswordState({@required this.emailId});
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future forgotPassProcess(context) async {
    var url =
        Uri.http(SERVER_URL, "interview_app_phpfiles/change_password.php");
    var response = await http.post(url, body: {
      "emailid": emailId!,
      "password": password.text,
      "latestupdatedtime": DateTime.now().toString(),
    });
    var data = await json.decode(json.encode(response.body));
    if (data != "Success") {
      passwordChangeNotifier();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangePasswordSuccess(),
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
                'Change Password',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                emailId!,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    color: Colors.grey),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                      //   child: TextFormField(
                      //     obscureText: true,
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: Colors.indigo[50],
                      //       labelText: 'Password',
                      //       prefixIcon: Icon(Icons.lock),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(8)),
                      //     ),
                      //     controller: password,
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Password cannot be empty';
                      //       }
                      //     },
                      //   ),
                      // ),
                      defaultTextField(context, 'Password', Icon(Icons.lock), password, true, passwordValidator, true),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                      //   child: TextFormField(
                      //     obscureText: true,
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: Colors.indigo[50],
                      //       labelText: 'Confirm Password',
                      //       prefixIcon: Icon(Icons.lock),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(8)),
                      //     ),
                      //     controller: confirmPassword,
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Password cannot be empty';
                      //       }
                      //       if (value != password.text)
                      //         return 'Passwords do not Match';
                      //     },
                      //   ),
                      // ),
                      defaultTextField(context, 'Confirm Password', Icon(Icons.lock), confirmPassword, true, confirmPasswordValidator(password), true),
                      Container(
                          margin: EdgeInsets.fromLTRB(40, 8, 40, 0),
                          child: ButtonTheme(
                            minWidth: width,
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0)),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Confirm Change',
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
                    ])),
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
                          builder: (context) => LogIn(),
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
