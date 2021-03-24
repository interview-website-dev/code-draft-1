import 'package:flutter/material.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';

class LoggerPageRedirection extends StatefulWidget {
  @override
  _LoggerPageRedirectionState createState() => _LoggerPageRedirectionState();
}

class _LoggerPageRedirectionState extends State<LoggerPageRedirection> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: defaultSuccessPage(
        'Are you Sure?',
        'It seems you are already Logged In',
        defaultLoginPageDashBoardRedirection(context),
      ),
    );
  }
}
