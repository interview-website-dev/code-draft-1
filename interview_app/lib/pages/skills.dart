//
// Stand by dart file
//
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';
import 'package:interview_app/models/Candidate.dart';
import 'package:interview_app/reusable_code_blocks/clickable_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashBoard.dart';
import 'package:interview_app/main.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool enabledStatus = false;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailid = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController city = TextEditingController();
 
  String? emailId;
List<Candidate?>? finalCandidate;
String? firstName;
@override
  void initState() {
    getValidationData();
    super.initState();
  }

 Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString("loggedInEmailId") ?? "";
    setState(() {
      emailId = obtainedEmail;
    });
    print(emailId);
     var url = Uri.http(SERVER_URL, "interview_app_phpfiles/get_candidate_info.php");
    var response = await http.post(url, body: {
      "emailid": emailId,
    });
    var data = json.decode(response.body);
    List<Candidate> candidate = data.map<Candidate>((json) {
        return Candidate.fromJson(json);
      }).toList();
      setState(() {
      finalCandidate = candidate;
      firstname.text = candidate[0].firstName!;
      lastname.text = candidate[0].lastName!;
      emailid.text = candidate[0].emailId!;
      mobilenumber.text = candidate[0].mobileNumber!;
      city.text = candidate[0].city!;
  });}
  @override
  Widget build(BuildContext context) {
    
    final dataKey = new GlobalKey();
    ScrollController _scrollController = ScrollController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     PreferredSize heading(){return PreferredSize(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                    child: Row(children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: 40.0,
                            height: 35.0,
                          )),
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
                      GestureDetector(
                    onTap: ()
                      =>setState((){enabledStatus = true;})
                     
                    ,
                    child:  Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              width: 40.0,
                              height: 35.0,
                              child: RichText(
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
                              ))),
                  ),
                     
                    ]),
                  ),
                  preferredSize: Size(180,30));}
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBarWidget(context, heading()),
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
                         
                        },
                      ),
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.indigo[50],
                      labelText: 'Firstname',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: firstname,
                    enabled: enabledStatus,
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
                    controller: city,
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                    onTap: () {
                      _scrollController.animateTo(
                          _scrollController.position.minScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: goToTopText(),
                  ),
                ),
              ],
            ),
          ),
        ),);
  }
}
