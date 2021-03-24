import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';
import 'package:interview_app/reusable_code_blocks/validation_functions.dart';
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';
import 'package:interview_app/pages/changePassword.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailId = TextEditingController();

  Future forgotPassProcess(context) async {
    var url =
        Uri.http(SERVER_URL, "interview_app_phpfiles/forgot_password.php");
    var response = await http.post(url, body: {
      "emailId": emailId.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangePassword(
            emailId: emailId.text,
          ),
        ),
      );
    } else {
      defaultSnackbar(context, "Invalid username input");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    void Function()? forgotPasswordValidationFunction = () {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      forgotPassProcess(context);
    };
    Form forgotPasswordForm() {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            defaultTextField(context, 'Email ID', Icon(Icons.person), emailId,
                false, emailSignInValidator(), true),
            defaultButton(
                'Change Password', width, forgotPasswordValidationFunction),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: defaultPageOne(
        context,
        "Forgot Password",
        forgotPasswordForm(),
        defaultSignUpWidget(context),
      ),
    );
  }
}
