import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dashBoard.dart';
import 'main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailid = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  Future register() async {
    var url = "http://192.168.29.154/interview_app_phpfiles/register.php";
    var response = await http.post(url, body: {
      "firstname": firstname.text,
      "lastname": lastname.text,
      "emailid": emailid.text,
      "mobilenumber": mobilenumber.text,
      "password": password.text,
    });
    /*var data = json.decode(response.body);*/
    var data= await json.decode(json.encode(response.body));
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: "User already exists",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
        msg: "Registeration successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(Icons.search),
    ),
    Icon(Icons.more_vert),
  ],
      centerTitle: true,
      leading: Icon(Icons.menu),
        title: Text('Interview app'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.red,
              Colors.blue
            ])          
         ),        
     ),      
 ),
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.indigo])),
          child: ListView(
            children: <Widget>[
              SizedBox(height:25),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Center(child:Text(
                  'Edit profile',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),),
              ),
              SizedBox(height:25),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Firstname',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: firstname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Lastname',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: lastname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Emailid',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: emailid,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Mobilenumber',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: mobilenumber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'City',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: emailid,
                ),
              ),
              
              Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                  color: Colors.black,
                ),
                Padding(
                padding: const EdgeInsets.only(left:20.0),
                child:Text(
                  'School details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),),
                SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'School Name',
                    prefixIcon: Icon(Icons.school_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: firstname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'School city',
                    prefixIcon: Icon(Icons.location_on_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: firstname,
                ),
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Container(              
  width: 100.0,
  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'passout year',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: emailid,
                ),
))),
Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                  child: Container(              
  width: 100.0,
  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Marks',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: null,
                ),
)))
                ]
                ),
                Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                  color: Colors.black,
                ),
                Padding(
                padding: const EdgeInsets.only(left:20.0),
                child:Text(
                  'Graduation details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),),
                SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'College Name',
                    prefixIcon: Icon(Icons.school_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'College city',
                    prefixIcon: Icon(Icons.location_on_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Specialization',
                    prefixIcon: Icon(Icons.precision_manufacturing_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: null,
                ),
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Container(              
  width: 100.0,
  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'passout year',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: emailid,
                ),
))),
Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                  child: Container(              
  width: 100.0,
  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Marks',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: emailid,
                ),
)))
                ]
                ),
                Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                  color: Colors.black,
                ),
                Padding(
                padding: const EdgeInsets.only(left:20.0),
                child:Text(
                  'Post Graduation details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),),
                SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'College Name',
                    prefixIcon: Icon(Icons.school_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'College city',
                    prefixIcon: Icon(Icons.location_on_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Specialization',
                    prefixIcon: Icon(Icons.precision_manufacturing_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: null,
                ),
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Container(              
  width: 100.0,
  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'passout year',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: emailid,
                ),
))),
Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                  child: Container(              
  width: 100.0,
  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.indigo[50],
                    labelText: 'Marks',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: emailid,
                ),
)))
                ]
                ),
                SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child:
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                    width: 200,
                    child: Center(child:RaisedButton(
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.red,
              Colors.blue
            ]) 
         
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Submit Changes",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
                              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
    ),
  ),
                  ),
                  )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

   