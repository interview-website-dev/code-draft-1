import 'package:flutter/material.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';

class LogOutSuccess extends StatefulWidget {
  @override
  _LogOutSuccessState createState() => _LogOutSuccessState();
}

class _LogOutSuccessState extends State<LogOutSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: defaultSuccessPage(
        'Success!',
        'Logged Out successfully',
        defaultSuccessPageLogInRedirection(context),
      ),
    );
  }
}
