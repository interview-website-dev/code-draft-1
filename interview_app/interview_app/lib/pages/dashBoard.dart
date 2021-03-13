import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interview_app/gobalConstants.dart';
import 'package:interview_app/pages/profile.dart';
import 'package:interview_app/pages/viewPostDetails.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/models/post.dart';
import 'package:interview_app/reusable-UI-widgets/drawers.dart';
class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Image.asset('assets/images/logo_final.png', width: 180),
            centerTitle: true,
            bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Positions Available',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        color: Colors.grey),
                  ),
                ),
                preferredSize: null),
          )),
      body: MainListView(),
      drawer: drawerWidget(),
      /*Center(
        child: RaisedButton(
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            );
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple[100], Color(0xFFFFFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: 50.0, maxHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Edit profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
          ),
        ),
      ),*/
    );
  }
}

class MainListView extends StatefulWidget {
  MainListViewState createState() => MainListViewState();
}

class MainListViewState extends State {
  final Uri apiURL = Uri.http(SERVER_URL, "interview_app_phpfiles/post_list.php");

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
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView(
          children: snapshot.data
              .map((data) => Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 8.0,
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 6.0),
                             
                                      child: ClipPath(child:Container(
                                        height: 180,
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 20),
                                       
                                       
                                        child: Stack(
                                          children: <Widget>[
                                            Table(
                                              columnWidths: {1: FixedColumnWidth(80.0)},
                                                children: [
                                                  TableRow(children: [  Text(
                                              data.positionName,
                                              style: TextStyle(
                                                decorationStyle:
                                                    TextDecorationStyle.dotted,
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ), Container(
            width: 40.0,
            height: 35.0,
            child :RaisedButton(
                    child: Text(
                                              "Apply",
                                              style: TextStyle(
                                                decorationStyle:
                                                    TextDecorationStyle.dotted,
      
                                                fontSize: 13.0,
                                              
                                              ),
                                            ),
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                    splashColor: Colors.grey,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    
                  )
            )
                                            ])]),
                                          
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
                                                      data.companyName,
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
                                                      data.date,
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
                                                      data.registeredTime,
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
                                      clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
               ),
                                  
                           
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        );
      },
    );
  }
}
