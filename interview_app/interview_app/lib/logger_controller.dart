import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

logIn(String emailId) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("isLoggedIn", true);
  preferences.setString("loggedInEmailId", emailId);
}

Future<bool> isLoggedIn() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool("isLoggedIn") ?? false;
}

Future<String> getLoggedInEmailId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("loggedInEmailId") ?? "page-redirection";
}

logOut() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("isLoggedIn", false);
  preferences.setString("loggedInEmailId", "");
}