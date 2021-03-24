import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interview_app/pages/success_pages/changePasswordSuccess.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';
import 'package:interview_app/reusable_code_blocks/validation_functions.dart';
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';

class ChangePassword extends StatefulWidget {
  final String emailId;
  ChangePassword({Key? key, required this.emailId}) : super(key: key);
  @override
  _ChangePasswordState createState() => _ChangePasswordState(emailId: emailId);
}

class _ChangePasswordState extends State<ChangePassword> {
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
      "emailId": emailId!,
      "password": password.text,
      "latestUpdatedTime": DateTime.now().toString(),
    });
    var data = await json.decode(json.encode(response.body));
    if (data != "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangePasswordSuccess(),
        ),
      );
    } else {
      defaultSnackbar(context, "Some Error Occurred!");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    void Function()? changePasswordValidationFunction = () {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      forgotPassProcess(context);
    };
    Form changePasswordForm() {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            defaultTextField(context, 'Password', Icon(Icons.lock), password,
                true, passwordSignUpValidator(), true),
            defaultTextField(
                context,
                'Confirm Password',
                Icon(Icons.lock),
                confirmPassword,
                true,
                confirmPasswordSignUpValidator(password),
                true),
            defaultButton(
                'Confirm Change', width, changePasswordValidationFunction),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: defaultPageOne(
        context,
        "Change Password",
        changePasswordForm(),
        defaultSignUpWidget(context),
      ),
    );
  }
}
