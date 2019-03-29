import 'package:agriwaste/MyRequests.dart';
import 'package:flutter/material.dart';
import 'NewRequest.dart';
void main() async {
  // Set default home.
  Widget _defaultHome = new NewRequest();

  // Run app!
  runApp(new MaterialApp(
    title: 'App',
    home: NewRequest(),
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/NewRequest': (BuildContext context) => new NewRequest(),
    },
      theme: ThemeData(
        accentColor: Colors.indigo[400], // used for card headers
        cardColor: Colors.white, // used for field backgrounds
        backgroundColor: Colors.indigo[100], // color outside the card
        primaryColor: Colors.teal, // color of page header
        buttonColor: Colors.lightBlueAccent[100], // background color of buttons
        textTheme: TextTheme(
          button: TextStyle(color: Colors.deepPurple[900]), // style of button text
          subhead: TextStyle(color: Colors.deepOrange[900]), // style of input text
        ),
  )
  )
  );
}
