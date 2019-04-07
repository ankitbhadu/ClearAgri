import 'dart:async';

import 'NewRequest.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'trackdriver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EnterPhone.dart';


class NumCheck extends StatefulWidget {
  @override
  _NumCheckState createState() => _NumCheckState();
}

class _NumCheckState extends State<NumCheck> {

  Future checkmobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobile = (prefs.getString('savitem.Mobile') ?? "");

    if (mobile == "") {

      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => new EnterPhone()));
    } else {
      prefs.setString('mobile', savitem.Mobile);
      MyRequestsDisplay();
    }
  }
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkmobile();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Icon(Icons.watch_later),
      ),
    );
  }
}












class MyRequestsDisplay extends StatefulWidget {
  @override
  _MyRequestsDisplayState createState() => _MyRequestsDisplayState();
}

class _MyRequestsDisplayState extends State<MyRequestsDisplay> {
  List<Item> allRequests = [];

  final Color accentColor = Color(0XFFFA2B0F);
  double width2;
  double height2;


  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    DatabaseReference ref =FirebaseDatabase.instance.reference();
    ref.child('book').child(savitem.Mobile).once().then((DataSnapshot snap){
      var keys = snap.value.keys;



      var data = snap.value;
      allRequests.clear();
      for(var key in keys){
        allRequests.add(new Item(
            data[key]['key'],
            data[key]['Name'],
            data[key]['Mobile'],
            data[key]['Address'],
            data[key]['HarvestDate'],
            data[key]['CropType'],
            data[key]['LandSize'],
            data[key]['Donations'],
            data[key]['Pincode'],
            data[key]['DName'],
            data[key]['DMobile'],
            data[key]['TrackStatus']

        ));
      }
      setState(() {
        print('Length: ${allRequests.length}');

      });

    });
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    width2=width;
    height2=height;
    // TODO: implement build
    return allRequests.length==0?new Text('No requests made',style: TextStyle(color: Colors.white,)):
    UI(allRequests, width, height);

//      new ListView.builder(
//        itemCount: allRequests.length,
//        itemBuilder: ( _,index){
//          return UI(
//            allRequests[index],width,height
//          );
//        }
//      );


  }
  Widget UI(List<Item> alldata,double width,double height)
  {
    return Scaffold(
      body: new Container(
        margin: EdgeInsets.only(top: 16),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: _buildBottomCard(width, height)
            ),
            _buildCardsList(alldata),

          ],
        ),
      ),
    );
  }


  Widget _buildBottomCard(double width, double height){
    return Container(
      width: width,
      height: height/5,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16)
          )
      ),

    );
  }

  Widget _buildItemCardChild(Item item){
    String date1 =item.HarvestDate;
    String orderid1=item.key;
    String title1=item.CropType;
    return
      Container(
          child: new Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("Order Date - $date1",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  new Text("Order ID- $orderid1",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold
                    ),
                  )

                ],

              ),
              Align( alignment: Alignment.bottomCenter,
                  child: new
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: new Text(
                      title1,textDirection: TextDirection.ltr,
                      style: new TextStyle(fontSize: 20.0,),textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  )

              )
            ],
          )


      );

  }

  Widget _buildItemCard(Item item,int index){
    return InkWell(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new MyRequestsDisplay2(index,allRequests)));
      },
      child: Container(
        width: 120,
        height: 145,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        margin: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10
              )
            ]
        ),
        child: _buildItemCardChild(item),
      ),
    );

  }
  Widget _buildCardsList(List<Item> items){
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        var item = items.elementAt(index);
        return _buildItemCard(item,index);
      },
    );
  }
}


















