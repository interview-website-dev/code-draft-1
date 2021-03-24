import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';
import 'dashBoard.dart';
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';
import 'logIn.dart';
import 'package:interview_app/models/City.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstNameTC = TextEditingController();
  TextEditingController lastNameTC = TextEditingController();
  TextEditingController emailIdTC = TextEditingController();
  TextEditingController mobileNumberTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController confirmPasswordTC = TextEditingController();
  TextEditingController cityTC = TextEditingController();
  Future register() async {
    var url = Uri.http(SERVER_URL, "interview_app_phpfiles/register.php");;
    var response = await http.post(url, body: {
      "firstName": firstNameTC.text,
      "lastName": lastNameTC.text,
      "emailId": emailIdTC.text,
      "mobileNumber": mobileNumberTC.text,
      "password": passwordTC.text,
      "city": cityTC.text,
      "registeredTime" : DateTime.now().toString(),
      "lastestUpdatedTime" : DateTime.now().toString(),
    });
    /*var data = json.decode(response.body);*/
    var data= await json.decode(json.encode(response.body));
    if (data == "Error") {
    
    }else {
    
    }
  }
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
        Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white])),
            child: Column(
              children: <Widget>[
                Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                child: Image.asset('assets/images/logo_final.png', width: 250),
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),
            ),
               
                defaultTextField(context, 'First Name', Icon(Icons.person), firstNameTC, false, null, true),
            
                  defaultTextField(context, 'Last Name', Icon(Icons.person), lastNameTC, false, null, true),
              
                  defaultTextField(context, 'Email ID', Icon(Icons.email), emailIdTC, false, null, true),
            
                  defaultTextField(context, 'Mobile Number', Icon(Icons.phone), mobileNumberTC, false, null, true),
              
                  defaultTextField(context, 'City', Icon(Icons.location_city_sharp), cityTC, false, null, true),
                
                  defaultTextField(context, 'Password', Icon(Icons.lock), passwordTC, true, null, true),
             
             defaultTextField(context, 'Confirm Password', Icon(Icons.lock), confirmPasswordTC, true, null, true),
               defaultButton('Sign Up', width, (){}),
               defaultSignInWidget(context),
              ],
        
              ),
        ),
      ],
    ));
  }
}