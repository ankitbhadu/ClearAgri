import 'NewRequest.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:agriwaste/NewRequest.dart';
class MyRequestsDisplay2 extends StatefulWidget {
  final int indexvar;
  final List<Item> allRequests;
  MyRequestsDisplay2(this.indexvar,this.allRequests);


  @override
  _MyRequestsDisplay2State createState() => _MyRequestsDisplay2State();
}

class _MyRequestsDisplay2State extends State<MyRequestsDisplay2> {


//  List<Item> allRequests = widget.allRequests2;

  final Color accentColor = Color(0XFFFA2B0F);
  double width2;
  double height2;
  List<String> itemcodes = [
    "Your request is in process",
    "Your request has been confirmed and driver will be assigned soon",
    "Your request is on track, driver has been assigned",
    "Vehicle has been dispatched, driver will contact you soon"

  ];

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
//    DatabaseReference ref =FirebaseDatabase.instance.reference();
//    ref.child('book').child(savitem.Mobile).once().then((DataSnapshot snap){
//      var keys = snap.value.keys;
//
//
//
//      var data = snap.value;
//      allRequests.clear();
//      for(var key in keys){
//        allRequests.add(new Item(
//          data[key][key],
//          data[key]['Address'],
//          data[key]['CropType'],
//          data[key]['DMobile'],
//          data[key]['DName'],
//          data[key]['Donations'],
//          data[key]['HarvestDate'],
//          data[key]['LandSize'],
//          data[key]['Mobile'],
//          data[key]['Name'],
//          data[key]['Pincode'],
//          data[key]['TrackStatus'],
//
//        ));
//      }
    setState(() {
      print('Length: ${widget.allRequests.length}');

    });

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    width2=width;
    height2=height;
    // TODO: implement build
    return widget.allRequests.length==0?new Text('No requests made'):
    UI2(widget.allRequests[widget.indexvar], width, height);

//      new ListView.builder(
//        itemCount: allRequests.length,
//        itemBuilder: ( _,index){
//          return UI(
//            allRequests[index],width,height
//          );
//        }
//      );


  }

  Widget UI2(Item item,double width,double height)
  {
    return new Card(child: new Container(
      margin: EdgeInsets.only(top: 16),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomCard(width, height)
          ),

          _buildCardsList3(item),
          _buildCardsList2(item),

        ],
      ),
    ),);
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




  Widget _buildItemCard2(Item item){
    return Container(
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
      child: _buildItemCardChild2(item),
    );
  }

  Widget _buildCardsList2(Item item){

    return Padding(padding: EdgeInsets.only(top: 160),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index){

          return _buildItemCard2(item);
        },
      ),
    );
  }

  Widget _buildItemCardChild2(Item item){
    String name= item.DName;
    String number=item.DMobile;
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text("",
              ),
              new Text("Driver Details ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              new Text("",
              ),

            ],

          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("Name - $name",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  new Text("+91 $number ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  new IconButton(icon: Icon(Icons.call), onPressed: (){launch("tel://+91$number");},iconSize: 50,),
                  new Text('Call Now')
                ],
              )
            ],
          )
        ],
      ),
    );
  }



  Widget _buildItemCardChild3(Item item,String statustext){
    String date1 =item.HarvestDate;
    String orderid1=FirebaseDatabase.instance.reference().child('book').child(savitem.Mobile).push().key;
    String title1=statustext;
    print('gggg');
    return Container(
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
      ),


    );
  }

  Widget _buildItemCard3(Item item,String statustext){
    print('inc3');
    return Container(
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
      child: _buildItemCardChild3( item,statustext),
    );
  }

  Widget _buildCardsList3(Item item){
    print('in3');
    return ListView.builder(
      itemCount: 1,

      itemBuilder: (context, index){
        var statusnumber=item.TrackStatus;
        print('${item.TrackStatus}');
        int stat;
        if(statusnumber==''){stat=0;}
        else {stat=int.parse(statusnumber);}
        var trackstring = itemcodes.elementAt(stat);
        return _buildItemCard3(item,trackstring);
      },
    );
  }




}




















//import 'package:agriwaste/NewRequest.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
////database referense.
//var MyRequests = FirebaseDatabase.instance
//    .reference()
//    .child('book').child('7000588523')
//    .orderByChild('HarvestDate')as Map<String, dynamic>;
////Now you can use stream builder to get the data.
//class MyRequestsDisplay extends StatefulWidget {
//  @override
//  _MyRequestsDisplayState createState() => _MyRequestsDisplayState();
//}
//
//class _MyRequestsDisplayState extends State<MyRequestsDisplay> {
//
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//      builder: (context, snap) {
//        if (snap.hasData && !snap.hasError && snap.data.snapshot.value!=null) {
//
////taking the data snapshot.
//          DataSnapshot snapshot = snap.data.snapshot;
//          List item=[];
//          List _list=[];
////it gives all the documents in this list.
//          _list=snapshot.value;
////Now we're just checking if document is not null then add it to another list called "item".
////I faced this problem it works fine without null check until you remove a document and then your stream reads data including the removed one with a null value(if you have some better approach let me know).
//          _list.forEach((f){
//            if(f!=null){
//              item.add(f);
//            }
//          }
//          );
//          return snap.data.snapshot.value == null
////return sizedbox if there's nothing in database.
//              ? SizedBox()
////otherwise return a list of widgets.
//              : ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemCount: item.length,
//            itemBuilder: (context, index) {
//              return Card(
//                 child: new Text (item[index]['HarvestDate'])
//              );
//            },
//          );
//        } else {
//          return   Center(child: CircularProgressIndicator());
//        }
//      },
//    );
//  }
//}