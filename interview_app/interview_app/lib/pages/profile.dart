import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dashBoard.dart';
import 'package:interview_app/main.dart';
import 'package:interview_app/reusable-UI-widgets/drawers.dart';
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
    var data = await json.decode(json.encode(response.body));
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
   final dataKey = new GlobalKey();
   ScrollController _scrollController = ScrollController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Image.asset('assets/images/logo_final.png', width: 180),
            centerTitle: true,
            bottom: PreferredSize(
                child:   Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                child:  Row(children: <Widget>[
          Expanded(
          flex: 1,
          child: Container(
            width: 40.0,
            height: 35.0,
           
            )
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            child: Text(
              
                    'Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        color: Colors.grey),
                  ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.fromLTRB(0,10,0,10),
            width: 40.0,
            height: 35.0,
            child :RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: "Edit",
        style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
      ),
      WidgetSpan(
        alignment: PlaceholderAlignment.top,
        child: Icon(Icons.edit_rounded, size: 14),
      ),
    ],
  ),
)
            )
        ),]),),
                preferredSize: null),
          )),
      body: Container(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            
           
            
              
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
              //   child: Center(child:Text(
              //     'Edit profile',
              //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //   ),),
              // ),
              // SizedBox(height:25),
               Container(
                 key: dataKey,
                  margin: EdgeInsets.fromLTRB(40, 8, 40, 0),
                  child: ButtonTheme(
                    minWidth: width,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Next Page',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        register();
                      },
                    ),
                  )),
                 
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  'School details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                            padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
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
                            padding: const EdgeInsets.fromLTRB(8, 8, 40, 8),
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
                  ]),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  'Graduation details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                            padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
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
                            padding: const EdgeInsets.fromLTRB(8, 8, 40, 8),
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
                  ]),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  'Post Graduation details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
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
                            padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
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
                            padding: const EdgeInsets.fromLTRB(8, 8, 40, 8),
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
                  ]),
              SizedBox(
                height: 10,
              ),
             
              MaterialButton(
                onPressed: () => {},
                child: GestureDetector(
                  onTap: () { _scrollController.animateTo(
                        _scrollController.position.minScrollExtent,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Go to",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
            
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: drawerWidget()
    );
  }
}
