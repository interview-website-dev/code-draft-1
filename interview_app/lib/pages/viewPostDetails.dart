import 'package:flutter/material.dart';

class ViewPostDetails extends StatefulWidget {
  ViewPostDetails(String string);

  @override
  _ViewPostDetailsState createState() => _ViewPostDetailsState();
}

class _ViewPostDetailsState extends State<ViewPostDetails> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
  leading: Icon(Icons.menu),
  title: Text('Interview app'),
  actions: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(Icons.search),
    ),
    Icon(Icons.more_vert),
  ],
  backgroundColor: Colors.purple[300],
),
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.indigo])),
          child: Column(
            children: <Widget>[
              SizedBox(height:25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ViewPostDetails',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height:25),
             
            
            ],
          ),
        ),
      ),
    );
  }
}
