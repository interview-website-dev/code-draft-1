import 'package:flutter/material.dart';
import 'package:interview_app/logger_controller.dart';
import 'package:interview_app/pages/dashBoard.dart';
import 'package:interview_app/pages/logOutSuccess.dart';
import 'package:interview_app/pages/profile.dart';
import 'package:interview_app/pages/register.dart';
import 'package:interview_app/reusable_code_blocks/clickable_text.dart';
import 'package:interview_app/reusable_code_blocks/validation_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Returns the custom app bar widget
PreferredSize customAppBarWidget(BuildContext context, PreferredSize heading) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100.0),
    child: AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Image.asset('assets/images/logo_final.png', width: 180),
      centerTitle: true,
      bottom: heading,
    ),
  );
}

/// Returns the default app bar heading widget
PreferredSize defaultAppBarHeader(BuildContext context, String heading) {
  return PreferredSize(
    preferredSize: Size(180, 30),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
            color: Colors.grey),
      ),
    ),
  );
}

/// Returns the custom drawer widget
class CustomDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset('assets/images/avatar-placeholder.png',
                      width: 80),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'FirstName LastName',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo[900],
            ),
          ),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Dashboard',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoard(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Log Out',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Colors.grey),
            ),
            onTap: () async {
              SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("isLoggedIn", false);
  print(preferences.getBool("isLoggedIn"));
  preferences.setString("loggedInEmailId", "");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogOutSuccess(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Returns the default text widget
Padding defaultTextField(
    BuildContext contextInput,
    String labelInput,
    Icon iconInput,
    TextEditingController controllerInput,
    bool obscureInput,
    String? Function(String?)? validationInput,
    bool enablationInput,) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
    child: TextFormField(
      obscureText: obscureInput,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.lightBlue[50],
        labelText: labelInput,
        prefixIcon: iconInput,
        border: new OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      controller: controllerInput,
      validator: validationInput,
      enabled: enablationInput,
    ),
  );
}

/// Returns the default signup widget
GestureDetector defaultSignUpWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(),
        ),
      );
    },
    child: clickToSignUpText(),
  );
}

Container defaultButtonWidget(BuildContext context, double widthInput,
    String labelInput, var onPressedInput) {
  return Container(
      margin: EdgeInsets.fromLTRB(40, 8, 40, 0),
      child: ButtonTheme(
        minWidth: widthInput,
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0)),
          padding: EdgeInsets.all(10),
          child: Text(
            labelInput,
            style: TextStyle(fontSize: 20.0),
          ),
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {
            onPressedInput;
          },
        ),
      ));
}
