import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';
import 'package:interview_app/reusable_code_blocks/logger_controller.dart';
import 'package:interview_app/models/Candidate.dart';
import 'package:interview_app/pages/profile.dart';
import 'package:interview_app/pages/viewPostDetails.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/models/Post.dart';
import 'package:interview_app/reusable_code_blocks/clickable_text.dart';
import 'package:interview_app/reusable_code_blocks/strut_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
 bool fabBool = false;
 
ScrollController _scrollController = ScrollController();
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
   
}

class _DashBoardState extends State<DashBoard> {
String? emailId;
String firstName = "firstName";
List<Candidate?>? finalCandidate;
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
    sharedPreferences.setString("loggedInFirstName",candidate[0].firstName!);
      setState(() {
      finalCandidate = candidate;
      firstName = candidate[0].firstName!;
  });}
  final String heading = "Positions Available";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
    body: MainListView(),
    drawer: customDrawerWidget(context, firstName),
  );
  }
}

class MainListView extends StatefulWidget {
  MainListViewState createState() => MainListViewState();
}

class MainListViewState extends State {
  final Uri apiURL =
      Uri.http(SERVER_URL, "interview_app_phpfiles/post_list.php");

  Future<List<Post>> fetchPosts() async {
    var response = await http.get(apiURL);

    if (response.statusCode == 200) {
      final items = jsonDecode(response.body);

      List<Post> postList = items.map<Post>((json) {
        return Post.fromJson(json);
      }).toList();

      return postList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  navigateToNextActivity(BuildContext context, int dataHolder) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ViewPostDetails(dataHolder.toString())));
  }

  @override
  Widget build(context) {
     double height = MediaQuery.of(context).size.height;
    return FutureBuilder<List<Post>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(

  backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                title:  SABT(
                child: Text("hiii")),
                background: freeFloatingLogo(),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  height: height,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top:10),
                  child: ListView(
              controller: _scrollController,
              reverse: true,
              shrinkWrap: true,
              children: snapshot.data!
                  .map((data) => Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      elevation: 8.0,
                                      margin: new EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 6.0),
                                      child: ClipPath(
                                        child: Container(
                                          height: 180,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 20, 20, 20),
                                          child: Stack(
                                            children: <Widget>[
                                              Table(columnWidths: {
                                                1: FixedColumnWidth(80.0)
                                              }, children: [
                                                TableRow(children: [
                                                  Text(
                                                    data.positionName!,
                                                    style: TextStyle(
                                                      decorationStyle:
                                                          TextDecorationStyle
                                                              .dotted,
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Container(
                                                      width: 40.0,
                                                      height: 35.0,
                                                      child: RaisedButton(
                                                        child: Text(
                                                          "Apply",
                                                          style: TextStyle(
                                                            decorationStyle:
                                                                TextDecorationStyle
                                                                    .dotted,
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                        color: Colors.green,
                                                        textColor: Colors.white,
                                                        splashColor:
                                                            Colors.grey,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 10, 10, 10),
                                                      ))
                                                ])
                                              ]),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Table(
                                                  children: [
                                                    TableRow(children: [
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                    ]),
                                                    TableRow(children: [
                                                      Text(
                                                        'Company Name',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        data.companyName!,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      )
                                                    ]),
                                                    TableRow(children: [
                                                      Text(
                                                        'Walk in Date',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        data.date!,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      )
                                                    ]),
                                                    TableRow(children: [
                                                      Text(
                                                        'Posted date',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        data.registeredTime!,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      )
                                                    ])
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        clipper: ShapeBorderClipper(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
                ),
              ),
            ),
          ],
        );
          
      },
    );
  }
}
class SABT extends StatefulWidget {
  final Widget child;
  const SABT({
   Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _SABTState createState() {
    return new _SABTState();
  }
}
class _SABTState extends State<SABT> {
  ScrollPosition? _position;
  bool? _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }
  void _addListener() {
    _position = Scrollable.of(context)!.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }
  void _removeListener() {
    _position?.removeListener(_positionListener);
  }
  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
      context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    bool visible = settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible!,
      child: widget.child,
    );
  }
}