import 'package:flutter/material.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';

class ChangePasswordSuccess extends StatefulWidget {
  @override
  _ChangePasswordSuccessState createState() => _ChangePasswordSuccessState();
}

class _ChangePasswordSuccessState extends State<ChangePasswordSuccess> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: defaultSuccessPage(
        'Success!',
        'Changed password successfully',
        defaultSuccessPageLogInRedirection(context),
      ),
    );
  }
}
