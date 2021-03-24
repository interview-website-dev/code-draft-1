import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';
import 'package:interview_app/models/Candidate.dart';
import 'package:interview_app/models/Skill.dart';
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
  bool profileVisibility = true;
  bool enabledStatus = false;
  TextEditingController firstNameTC = TextEditingController();
  TextEditingController lastNameTC = TextEditingController();
  TextEditingController emailIdTC = TextEditingController();
  TextEditingController mobileNumberTC = TextEditingController();
  TextEditingController cityTC = TextEditingController();
  TextEditingController schNameTC = TextEditingController();
  TextEditingController schCityTC = TextEditingController();
  TextEditingController schPassedYearTC = TextEditingController();
  TextEditingController schMarksTC = TextEditingController();
  TextEditingController ugNameTC = TextEditingController();
  TextEditingController ugCityTC = TextEditingController();
  TextEditingController ugSpecializationTC = TextEditingController();
  TextEditingController ugPassedYearTC = TextEditingController();
  TextEditingController ugMarksTC = TextEditingController();
  TextEditingController pgNameTC = TextEditingController();
  TextEditingController pgCityTC = TextEditingController();
  TextEditingController pgSpecializationTC = TextEditingController();
  TextEditingController pgPassedYearTC = TextEditingController();
  TextEditingController pgMarksTC = TextEditingController();
  List<Skill> skills = [];
  List<Candidate> finalCandidate = [];
  String firstName = "firstName";
  String? emailId;
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
    var url =
        Uri.http(SERVER_URL, "interview_app_phpfiles/get_candidate_info.php");
    var response = await http.post(url, body: {
      "emailid": emailId,
    });
    var data = json.decode(response.body);
    List<Candidate> candidate = data.map<Candidate>((json) {
      return Candidate.fromJson(json);
    }).toList();
    setState(() {
      finalCandidate = candidate;
      firstName = candidate[0].firstName!;
      firstNameTC.text = candidate[0].firstName!;
      lastNameTC.text = candidate[0].lastName!;
      emailIdTC.text = candidate[0].emailId!;
      mobileNumberTC.text = candidate[0].mobileNumber!;
      cityTC.text = candidate[0].city!;
      schNameTC.text = candidate[0].schName!;
      schCityTC.text = candidate[0].schCity!;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    PreferredSize heading() {
      return PreferredSize(
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
              Visibility(
                maintainState: false,
                visible: !enabledStatus,
                child: Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () => setState(() {
                            enabledStatus = true;
                          }),
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
              ),
              Visibility(
                maintainState: false,
                visible: enabledStatus,
                child: Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () => setState(() {
                            enabledStatus = false;
                          }),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          width: 40.0,
                          height: 35.0,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Cancel Edit",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink[900]),
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Icon(Icons.cancel_rounded, size: 14),
                                ),
                              ],
                            ),
                          ))),
                ),
              ),
            ]),
          ),
          preferredSize: Size(180, 30));
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBarWidget(context, heading()),
           floatingActionButton:    FloatingActionButton(onPressed: null, child:new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[FloatingActionButton(
  backgroundColor: Colors.blueAccent,
  foregroundColor: Colors.white,
  onPressed: () {
    setState(
                              () {
                                profileVisibility = false;
                              },
                            );
  },
  child: Icon(Icons.arrow_upward_rounded),
),FloatingActionButton(
  backgroundColor: Colors.indigo[900],
  foregroundColor: Colors.white,
  onPressed: () {
   
       _scrollController.animateTo(
                                  _scrollController.position.minScrollExtent,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
  },
  child: Icon(Icons.arrow_upward_rounded),
),]),),
        body: Container(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  maintainState: true,
                  visible: profileVisibility,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        defaultButton(
                          "Next Page",
                          width,
                          () {
                            setState(
                              () {
                                profileVisibility = false;
                              },
                            );
                          },
                        ),
                          defaultProfileSubHeadings(width, 'Basic User Info'),
                        defaultTextField(
                            context,
                            'FirstName',
                            Icon(Icons.person),
                            firstNameTC,
                            false,
                            null,
                            enabledStatus),
                        defaultTextField(
                            context,
                            'LastName',
                            Icon(Icons.person),
                            lastNameTC,
                            false,
                            null,
                            enabledStatus),
                                defaultTextField(context, 'Age', Icon(Icons.calendar_today),
                            mobileNumberTC, false, null, enabledStatus),
                             defaultTextField(context, 'Gender', Icon(Icons.people_alt_rounded),
                            mobileNumberTC, false, null, enabledStatus),
                        defaultTextField(context, 'Email ID', Icon(Icons.email),
                            emailIdTC, false, null, enabledStatus),
                         defaultTextField(context, 'Mobilenumber', Icon(Icons.phone),
                            mobileNumberTC, false, null, enabledStatus),
                         
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
                            controller: cityTC,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
               
                        defaultProfileSubHeadings(width, 'School details'),
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
                            controller: firstNameTC,
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
                            controller: firstNameTC,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 8, 8, 8),
                                      child: Container(
                                        width: 100.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.indigo[50],
                                            labelText: 'passout year',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          controller: emailIdTC,
                                        ),
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 40, 8),
                                      child: Container(
                                        width: 100.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.indigo[50],
                                            labelText: 'Marks',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          controller: null,
                                        ),
                                      )))
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                    
                        defaultProfileSubHeadings(width, 'Graduation details'),
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
                              prefixIcon:
                                  Icon(Icons.precision_manufacturing_outlined),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 8, 8, 8),
                                      child: Container(
                                        width: 100.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.indigo[50],
                                            labelText: 'passout year',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          controller: emailIdTC,
                                        ),
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 40, 8),
                                      child: Container(
                                        width: 100.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.indigo[50],
                                            labelText: 'Marks',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          controller: emailIdTC,
                                        ),
                                      )))
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                      
                        defaultProfileSubHeadings(width, 'Post Graduation details'),
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
                              prefixIcon:
                                  Icon(Icons.precision_manufacturing_outlined),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 8, 8, 8),
                                      child: Container(
                                        width: 100.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.indigo[50],
                                            labelText: 'passout year',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          controller: emailIdTC,
                                        ),
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 40, 8),
                                      child: Container(
                                        width: 100.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.indigo[50],
                                            labelText: 'Marks',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          controller: emailIdTC,
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
                      ]),
                ),
                Visibility(
                  maintainState: true,
                  visible: !profileVisibility,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        defaultButton(
                          "Go Back",
                          width,
                          () {
                            setState(
                              () {
                                profileVisibility = true;
                              },
                            );
                          },
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
                            'Skills',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: enabledStatus,
                          child: defaultButton(
                            "Submit Changes",
                            width,
                            () {},
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
        drawer: customDrawerWidget(context, firstName));
  }
}
