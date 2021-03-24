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
   List<Skill> computationskills = [];
   List<Skill> languageskills = [];
   List<Skill> onJobskills = [];
  String _skillName1 = 'Flutter';
   String _proficiencyLevel1 = 'Beginner';
   String _skillName2 = 'Flutter';
   String _proficiencyLevel2 = 'Beginner';
   String _skillName3 = 'Flutter';
   String _proficiencyLevel3 = 'Beginner';
   int _selectedIndex = 0;
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
      schPassedYearTC.text = candidate[0].schPassedYear!;
      schMarksTC.text = candidate[0].schMarks!;
      ugNameTC.text = candidate[0].ugName!;
      ugCityTC.text = candidate[0].ugCity!;
      ugPassedYearTC.text = candidate[0].ugPassedYear!;
      ugMarksTC.text = candidate[0].ugMarks!;
      pgNameTC.text = candidate[0].pgName!;
      pgCityTC.text = candidate[0].pgCity!;
      pgPassedYearTC.text = candidate[0].pgPassedYear!;
      pgMarksTC.text = candidate[0].pgMarks!;

    });
  }
void _onItemTapped(int index) {
  if(index == 0){
 setState(
                              () {
                                 
                                profileVisibility = true;
                                _selectedIndex = index;
                              },
                            );
  }else if(index == 2){setState(
                              () {
                                profileVisibility = false;
                                 _selectedIndex = index;
                              },
                            );}
    setState(() {
      
     
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
         bottomNavigationBar: BottomNavigationBar(
    
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.person_outline_rounded),

           label: 'Details',
         ),
        
        new BottomNavigationBarItem(
          label: '',
           icon: enabledStatus == false ? SizedBox(width:20,height:47) : TextButton(
        style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(width, 20)),backgroundColor: MaterialStateProperty.all(Colors.blue), foregroundColor: MaterialStateProperty.all(Colors.white),padding: MaterialStateProperty.all(
                      EdgeInsets.all(10)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    )
  )
),
       
        
        child: Text(
         "Submit",
          style: TextStyle(fontSize: 20.0),
        ),
     
        onPressed: (){},
      ),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.table_view_rounded),
           label: 'Skills',
         ),
        
       ],
         currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
     ),
        appBar: customAppBarWidget(context, heading()),
           floatingActionButton:    FloatingActionButton(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  onPressed: () {
   
       _scrollController.animateTo(
                                  _scrollController.position.minScrollExtent,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
  },
  child: Icon(Icons.arrow_upward_rounded),
),
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
                     SizedBox(height:10),
                        defaultTextField(
                            context,
                            'First Name',
                            Icon(Icons.person),
                            firstNameTC,
                            false,
                            null,
                            enabledStatus),
                        defaultTextField(
                            context,
                            'Last Name',
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
                         defaultTextField(context, 'Mobile Number', Icon(Icons.phone),
                            mobileNumberTC, false, null, enabledStatus),
                         
                         defaultTextField(context, 'City', Icon(Icons.location_city),
                            cityTC, false, null, enabledStatus),
                            
                        SizedBox(
                          height: 10,
                        ),
               
                        defaultProfileSubHeadings(width, 'School Details'),
                        SizedBox(
                          height: 10,
                        ),
                      
                        defaultTextField(context, 'School Name',Icon(Icons.school_rounded),
                            schNameTC, false, null, enabledStatus),
                      
                        defaultTextField(context, 'School City',Icon(Icons.location_on_sharp),
                            schCityTC, false, null, enabledStatus),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child:  defaultLeftSmallTextField(context, 'Passout Year', schPassedYearTC, false, null, enabledStatus),),
                                     
                              Expanded(
                                  child: defaultRightSmallTextField(context, 'Marks', schMarksTC, false, null, enabledStatus),),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                    
                        defaultProfileSubHeadings(width, 'Graduation Details'),
                        SizedBox(
                          height: 10,
                        ),
                        
                        defaultTextField(context, 'College Name',Icon(Icons.school_rounded),
                            ugNameTC, false, null, enabledStatus),
                        
                        defaultTextField(context, 'College City',Icon(Icons.location_on_sharp),
                            ugCityTC, false, null, enabledStatus),
                        
                        defaultTextField(context, 'Specialization',Icon(Icons.precision_manufacturing_outlined),
                            ugSpecializationTC, false, null, enabledStatus),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Expanded(
                                  child:  defaultLeftSmallTextField(context, 'Passout Year', ugPassedYearTC, false, null, enabledStatus),),
                                     
                              Expanded(
                                  child: defaultRightSmallTextField(context, 'Marks', ugMarksTC, false, null, enabledStatus),),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                      
                        defaultProfileSubHeadings(width, 'Post Graduation Details'),
                        SizedBox(
                          height: 10,
                        ),
                        
                        defaultTextField(context, 'College Name',Icon(Icons.school_rounded),
                            pgNameTC, false, null, enabledStatus),
                        
                        defaultTextField(context, 'College City',Icon(Icons.location_on_sharp),
                            pgCityTC, false, null, enabledStatus),
                        
                        defaultTextField(context, 'Specialization',Icon(Icons.precision_manufacturing_outlined),
                            pgSpecializationTC, false, null, enabledStatus),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                               Expanded(
                                  child:  defaultLeftSmallTextField(context, 'Passout Year', pgPassedYearTC, false, null, enabledStatus),),
                                     
                              Expanded(
                                  child: defaultRightSmallTextField(context, 'Marks', pgMarksTC, false, null, enabledStatus),),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                       
                      ]),
                ),
                Visibility(
                  maintainState: true,
                  visible: !profileVisibility,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                     
                        SizedBox(
                          height: 10,
                        ),
                    defaultSkillSubHeadings(width, 'Computation Skills', (){}),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                           
                              Padding(padding:EdgeInsets.only(left:20)),
                      Expanded(child: DropdownButton<String>(
  focusColor:Colors.grey,
  value: _skillName1,
  //elevation: 5,
  style: TextStyle(color: Colors.grey,fontSize:20),
  iconEnabledColor:Colors.black,
  isExpanded: true,
  items: <String>[
    'Android',
    'IOS',
    'Flutter',
    'Node',
    'Java',
    'Python',
    'PHP',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value,style:TextStyle(color:Colors.black),),
    );
  }).toList(),
  hint:Text(
    "",
    style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
  onChanged: (String? value) {
    setState(() {
      _skillName1 = value!;
    });
  }),),
   Container(margin: EdgeInsets.fromLTRB(8, 8, 20, 8),child:     DropdownButton<String>(
  focusColor:Colors.grey,
  value: _proficiencyLevel1,
  //elevation: 5,
  style: TextStyle(color: Colors.grey,fontSize:20),
  iconEnabledColor:Colors.black,
  items: <String>[
    'Beginner',
    'Intermediate',
    'Advanced',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value,style:TextStyle(color:Colors.black),),
    );
  }).toList(),
  hint:Text(
    "Select a skill",
    style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
  onChanged: (String? value) {
    setState(() {
     _proficiencyLevel1 = value!;
    });
  }),)

                            ]),
                    
                    
                          SizedBox(
                          height: 10,
                        ),
               defaultSkillSubHeadings(width, 'Language Skills', (){}),
                        SizedBox(
                          height: 10,
                        ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                           
                              Padding(padding:EdgeInsets.only(left:20)),
                      Expanded(child: DropdownButton<String>(
  focusColor:Colors.grey,
  value: _skillName2,
  //elevation: 5,
  style: TextStyle(color: Colors.grey,fontSize:20),
  iconEnabledColor:Colors.black,
  isExpanded: true,
  items: <String>[
    'Android',
    'IOS',
    'Flutter',
    'Node',
    'Java',
    'Python',
    'PHP',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value,style:TextStyle(color:Colors.black),),
    );
  }).toList(),
  hint:Text(
    "",
    style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
  onChanged: (String? value) {
    setState(() {
      _skillName2 = value!;
    });
  }),),
   Container(margin: EdgeInsets.fromLTRB(8, 8, 20, 8),child:     DropdownButton<String>(
  focusColor:Colors.grey,
  value: _proficiencyLevel2,
  //elevation: 5,
  style: TextStyle(color: Colors.grey,fontSize:20),
  iconEnabledColor:Colors.black,
  items: <String>[
    'Beginner',
    'Intermediate',
    'Advanced',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value,style:TextStyle(color:Colors.black),),
    );
  }).toList(),
  hint:Text(
    "Select a skill",
    style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
  onChanged: (String? value) {
    setState(() {
     _proficiencyLevel2 = value!;
    });
  }),)

                            ]),
                          SizedBox(
                          height: 10,
                        ),
                     defaultSkillSubHeadings(width, 'OnJob Skills', (){ setState(() {
                       Skill skill = new Skill();
                       skill.candidateId = finalCandidate[0].candidateId!;
                       skill.skillName = _skillName3;
                       skill.proficiencyLevel = _proficiencyLevel3;
                       skill.skillType = 'onJob';
     onJobskills.add(skill);
    });}),
                        SizedBox(
                          height: 10,
                        ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                           
                              Padding(padding:EdgeInsets.only(left:20)),
                      Expanded(child: DropdownButton<String>(
  focusColor:Colors.grey,
  value: _skillName3,
  //elevation: 5,
  style: TextStyle(color: Colors.grey,fontSize:20),
  iconEnabledColor:Colors.black,
  isExpanded: true,
  items: <String>[
    'Android',
    'IOS',
    'Flutter',
    'Node',
    'Java',
    'Python',
    'PHP',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value,style:TextStyle(color:Colors.black),),
    );
  }).toList(),
  hint:Text(
    "",
    style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
  onChanged: (String? value) {
    setState(() {
      _skillName3 = value!;
    });
  }),),
   Container(margin: EdgeInsets.fromLTRB(8, 8, 20, 8),child:     DropdownButton<String>(
  focusColor:Colors.grey,
  value: _proficiencyLevel3,
  //elevation: 5,
  style: TextStyle(color: Colors.grey,fontSize:20),
  iconEnabledColor:Colors.black,
  items: <String>[
    'Beginner',
    'Intermediate',
    'Advanced',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value,style:TextStyle(color:Colors.black),),
    );
  }).toList(),
  hint:Text(
    "Select a skill",
    style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
  onChanged: (String? value) {
    setState(() {
     _proficiencyLevel3 = value!;
    });
  }),),
 

                            ]),
                            SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
      itemCount: onJobskills.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          child: ListTile(
            title: Text(
              'Item ${onJobskills[index]}',
            ),
          ),
          background: Container(
            color: Colors.green,
          ),
          key: ValueKey<int>(index),
          onDismissed: (DismissDirection direction) {
            setState(() {
              onJobskills.remove(index);
            });
          },
        );
      },
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


