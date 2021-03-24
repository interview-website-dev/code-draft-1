import 'package:flutter/material.dart';
import 'package:interview_app/pages/logIn.dart';
import 'package:interview_app/reusable_code_blocks/logger_controller.dart';
import 'package:interview_app/pages/dashBoard.dart';
import 'package:interview_app/pages/success_pages/logOutSuccess.dart';
import 'package:interview_app/pages/profile.dart';
import 'package:interview_app/pages/register.dart';
import 'package:interview_app/reusable_code_blocks/clickable_text.dart';
import 'package:interview_app/reusable_code_blocks/validation_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Returns the free Floating Logo image
Padding freeFloatingLogo() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset('assets/images/logo_final.png', width: 250),
  );
}

Padding freeFloatingHeader(String headingInput) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      headingInput,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 3.0,
          color: Colors.grey),
    ),
  );
}

Container defaultPageOne(BuildContext contextInput, String headingInput,
    Form formInput, Widget bottomWidget) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    color: Colors.white,
    child: Column(
      children: <Widget>[
        SizedBox(height: 150),
        freeFloatingLogo(),
        SizedBox(height: 25),
        freeFloatingHeader(headingInput),
        SizedBox(height: 25),
        formInput,
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: bottomWidget,
          ),
        ),
      ],
    ),
  );
}

Container defaultSuccessPage(String mainTextInput, String subTextInput,
    Widget defaultsuccessPageLogInRedirectionInput) {
  return Container(
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
            mainTextInput,
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
            subTextInput,
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
        defaultsuccessPageLogInRedirectionInput,
      ],
    ),
  );
}

GestureDetector defaultSuccessPageLogInRedirection(BuildContext context) {
  return GestureDetector(
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ]),
  );
}
GestureDetector defaultLoginPageDashBoardRedirection(BuildContext context) {
  return GestureDetector(
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ]),
  );
}


void defaultSnackbar(BuildContext context, String warningMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.yellow[300],
      margin: EdgeInsets.fromLTRB(25, 25, 25, 50),

      content: Text(
        warningMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      duration: const Duration(milliseconds: 1500),
      // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

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

Drawer customDrawerWidget(BuildContext contextInput, String? firstNameInput) {
  return Drawer(
    child: Column(
      children: <Widget>[
        DrawerHeader(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset('assets/images/avatar-placeholder.png', width: 80),
                SizedBox(
                  height: 20,
                ),
                Text(
                  firstNameInput!,
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
              contextInput,
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
              contextInput,
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
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setBool("isLoggedIn", false);
            print(preferences.getBool("isLoggedIn"));
            preferences.setString("loggedInEmailId", "");
            Navigator.push(
              contextInput,
              MaterialPageRoute(
                builder: (context) => LogOutSuccess(),
              ),
            );
          },
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("copywrite information to be inserted here")),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

/// Returns the default text widget
Padding defaultTextField(
  BuildContext contextInput,
  String labelInput,
  Icon iconInput,
  TextEditingController controllerInput,
  bool obscureInput,
  String? Function(String?)? validationInput,
  bool enablationInput,
) {
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

Padding defaultLeftSmallTextField(
  BuildContext contextInput,
  String labelInput,
  TextEditingController controllerInput,
  bool obscureInput,
  String? Function(String?)? validationInput,
  bool enablationInput,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
    child: Container(
      width: 100.0,
      child: TextFormField(
        obscureText: obscureInput,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.lightBlue[50],
          labelText: labelInput,

          border:
              new OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        controller: controllerInput,
        validator: validationInput,
        enabled: enablationInput,
      ),
    ),
  );
}

Padding defaultRightSmallTextField(
  BuildContext contextInput,
  String labelInput,
  TextEditingController controllerInput,
  bool obscureInput,
  String? Function(String?)? validationInput,
  bool enablationInput,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 40, 8),
    child: Container(
      width: 100.0,
      child: TextFormField(
        obscureText: obscureInput,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.lightBlue[50],
          labelText: labelInput,
          border:
              new OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        controller: controllerInput,
        validator: validationInput,
        enabled: enablationInput,
      ),
    ),
  );
}

/// Returns the default button widget
Container defaultButton(
    String label, double width, void Function()? onPressedInput) {
  return Container(
    margin: EdgeInsets.fromLTRB(40, 8, 40, 0),
    child: ButtonTheme(
      minWidth: width,
      child: TextButton(
        style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(width, 20)),backgroundColor: MaterialStateProperty.all(Colors.blue), foregroundColor: MaterialStateProperty.all(Colors.white),padding: MaterialStateProperty.all(
                      EdgeInsets.all(10)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    )
  )
),
       
        
        child: Text(
          label,
          style: TextStyle(fontSize: 20.0),
        ),
     
        onPressed: onPressedInput,
      ),
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

GestureDetector defaultSignInWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(),
        ),
      );
    },
    child: regisSignInText(),
  );
}

Container defaultProfileSubHeadings(double? widthInput, String headingInput) {
  return Container(
    alignment: Alignment.centerLeft,
    color: Colors.indigo[800],
    width: widthInput,
    height: 50,
    margin: const EdgeInsets.only(left: 20, right: 20),
    child: Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Text(
        headingInput,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Container defaultSkillSubHeadings(double widthInput,String headingInput, void Function()? onPressedInput){return   Container(
    alignment: Alignment.centerLeft,
    color: Colors.indigo[800],
    width: widthInput,
    height: 50,
    margin: const EdgeInsets.only(left: 20, right: 20),
    child: Row(children: [Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Text(
        headingInput,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),Expanded(
          child: Align(
            alignment: FractionalOffset.centerRight,
            child: Padding(padding: EdgeInsets.only(right:8), child:OutlinedButton(
    child: Text('Add'),
    style: OutlinedButton.styleFrom(
      primary: Colors.green,
      backgroundColor: Colors.white,
      side: BorderSide(color: Colors.indigo[700]!, width: 5),
    ),
    onPressed: onPressedInput,
  ),),
          ),
        ),],   )
  );}