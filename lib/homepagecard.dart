import 'package:flutter/material.dart';


class HomepageInfoCard extends StatefulWidget {
  @override
  _HomepageInfoCardState createState() => _HomepageInfoCardState();
}

class _HomepageInfoCardState extends State<HomepageInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 300,
      child: SizedBox.expand(


        child: new Card(
          child: new Text('infoall'),
          margin: EdgeInsets.all(20),

        ),
      ),

    );
  }
}


class HomepageButtons extends StatefulWidget {
  @override
  _HomepageButtonsState createState() => _HomepageButtonsState();
}

class _HomepageButtonsState extends State<HomepageButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 140,
                child: new Card(
                  child: new Icon(Icons.ac_unit),
                ),
              ),
              SizedBox(
                height: 100,
                width: 140,
                child: new Card(
                  child: new Icon(Icons.ac_unit),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 140,
                child: new Card(
                  child: new Icon(Icons.ac_unit),
                ),
              ),
              SizedBox(
                height: 100,
                width: 140,
                child: new Card(
                  child: new Icon(Icons.ac_unit),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}