import 'package:flutter/material.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';

class RegisterationSuccess extends StatefulWidget {
  @override
  _RegisterationSuccessState createState() => _RegisterationSuccessState();
}

class _RegisterationSuccessState extends State<RegisterationSuccess> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: defaultSuccessPage(
        'Success!',
        'Registered successfully',
        defaultSuccessPageLogInRedirection(context),
      ),
    );
  }
}
