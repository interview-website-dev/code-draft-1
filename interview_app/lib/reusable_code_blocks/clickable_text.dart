import 'package:flutter/material.dart';
import 'package:interview_app/pages/register.dart';

Row goToTopText() {
  return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Go to",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Top",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[900]),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Icon(Icons.arrow_upward_rounded, size: 14),
              ),
            ],
          ),
        )
      ]);
}

Row clickToSignInText() {
  return Row(
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
      ]);
}

Row clickToSignUpText() {
  return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.pink[900]),
        )
      ]);
}

