import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

logIn(String emailId) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("isLoggedIn", true);
  preferences.setString("loggedInEmailId", emailId);
}

isLoggedIn() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool("isLoggedIn") ?? false;
}

Future getLoggedInEmailId(String emailId) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.getString("loggedInEmailId");
}

logOut() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("isLoggedIn", false);
  preferences.setString("loggedInEmailId", "");
  print(preferences.getBool("isLoggedIn"));
  print(preferences.getString("loggedInEmailId"));
}