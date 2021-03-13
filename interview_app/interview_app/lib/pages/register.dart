import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dashBoard.dart';
import 'package:interview_app/gobalConstants.dart';
import 'logIn.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:interview_app/models/city.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailid = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController city = TextEditingController();
  Future register() async {
    var url = Uri.http(SERVER_URL, "interview_app_phpfiles/register.php");;
    var response = await http.post(url, body: {
      "firstname": firstname.text,
      "lastname": lastname.text,
      "emailid": emailid.text,
      "mobilenumber": mobilenumber.text,
      "password": password.text,
      "city": city.text,
      "registeredtime" : DateTime.now(),
      "updatedtime" : DateTime.now(),
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
    }else {
      Fluttertoast.showToast(
          msg: "Registeration successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard(),),);
    }
  }
  GlobalKey<AutoCompleteTextFieldState<City>> key = new GlobalKey();

  AutoCompleteTextField searchTextField;

  TextEditingController controller = new TextEditingController();

  void _loadData() async {
    await CitiesViewModel.loadCities();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
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
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
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
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.indigo[50],
                      labelText: 'EmailID',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: emailid,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
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
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.indigo[50],
                      labelText: 'City',
                      prefixIcon: Icon(Icons.location_city_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: city,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.indigo[50],
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: password,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.indigo[50],
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: confirmPassword,
                  ),
                ),
              
                 Container(
                  margin: EdgeInsets.fromLTRB(40, 8, 40, 0),
                child: ButtonTheme(
                  minWidth: width,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      register();
                    },
                  ),
                )),
             MaterialButton(
                  onPressed: () => {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogIn(),
                        ),
                      );
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already a member?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
                          )
                        ]),
                  ),
                ),
              ],
        
              ),
        ),
      ],
    ));
  }
}

class AutoComplete extends StatefulWidget {
  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  GlobalKey<AutoCompleteTextFieldState<City>> key = new GlobalKey();

  AutoCompleteTextField searchTextField;

  TextEditingController controller = new TextEditingController();

  _AutoCompleteState();

  void _loadData() async {
    await CitiesViewModel.loadCities();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Auto Complete List Demo'),
        ),
        body: new Center(
            child: new Column(children: <Widget>[
          new Column(children: <Widget>[
            searchTextField = AutoCompleteTextField<City>(
                style: new TextStyle(color: Colors.black, fontSize: 16.0),
                decoration: new InputDecoration(
                    suffixIcon: Container(
                      width: 85.0,
                      height: 60.0,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    filled: true,
                    hintText: 'City',
                    hintStyle: TextStyle(color: Colors.black)),
                itemSubmitted: (item) {
                  setState(() => searchTextField.textField.controller.text =
                      item.cityName);
                },
                clearOnSubmit: false,
                key: key,
                suggestions: CitiesViewModel.cities,
                itemBuilder: (context, item) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(item.cityName,
                      style: TextStyle(
                        fontSize: 16.0
                      ),),
                    ],
                  );
                },
                itemSorter: (a, b) {
                  return a.cityName.compareTo(b.cityName);
                },
                itemFilter: (item, query) {
                  return item.cityName
                      .toLowerCase()
                      .startsWith(query.toLowerCase());
                }),
          ]),
        ])));
  }
}