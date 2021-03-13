import 'dart:convert';

import 'package:flutter/material.dart';
import 'gobalConstants.dart';
import 'profile.dart';
import 'viewPostDetails.dart';
import 'package:http/http.dart' as http;
import 'models/post.dart';

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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Align(alignment: Alignment.center,child:Column(children: [Image.asset('assets/images/avatar-placeholder.png', width: 80),SizedBox(
                        height: 20,
                      ),Text(
                'FirstName LastName',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),],)),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
            ),
             ListTile(
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),
              onTap: () {
               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
              },
            ),
            ListTile(
              title: Text(
                'Dashboard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 3.0,
      color:Colors.grey),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
  final String apiURL = SERVER_URL + '/interview_app_phpfiles/post_list.php';

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
                                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                                children: [
                                                  TableRow(children: [  Text(
                                              data.positionName,
                                              style: TextStyle(
                                                decorationStyle:
                                                    TextDecorationStyle.dotted,
                                                color: Colors.black,
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ), RaisedButton(
                                                child: Text('Apply',style: TextStyle(
                                                decorationStyle:
                                                    TextDecorationStyle.dotted,
                                                color: Colors.green,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                                
                                                shape: RoundedRectangleBorder(
                                                 side: BorderSide(color: Colors.green, width: 2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0))),
                                                onPressed: () {},
                                              ),
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
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      data.companyName,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                      ),
                                                    )
                                                  ]),
                                                  TableRow(children: [
                                                    Text(
                                                      'Walk in Date',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      data.date,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                      ),
                                                    )
                                                  ]),
                                                  TableRow(children: [
                                                    Text(
                                                      'Posted date',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      data.registeredTime,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
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
