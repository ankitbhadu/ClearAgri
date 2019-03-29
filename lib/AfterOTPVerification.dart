import 'package:agriwaste/MyRequests.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'NewRequest.dart';
import 'OnSubmitForm.dart';
FirebaseDatabase database = new FirebaseDatabase();

void SubmitFormData(){
  print(cnf);
  print(savitem.Name+'Jai Mata DI');
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  FirebaseDatabase.instance.setPersistenceCacheSizeBytes(10000000);
  if(cnf){
    FirebaseDatabase.instance.reference().child('book').child(savitem.Mobile).child(savitem.CropType).set(
        {
      'Name': savitem.Name,
      'LandSize': savitem.LandSize,
      'HarvestDate': savitem.HarvestDate,
      'Address':savitem.Address,
      'Mobile':savitem.Mobile,
      'CropType':savitem.CropType,
          'DName':savitem.DName,
          'DMobile':savitem.DMobile,
          'TrackStatus':savitem.TrackStatus,

    });}
}
class AfterOTPVerification extends StatefulWidget {
  @override
  _AfterOTPVerificationState createState() => _AfterOTPVerificationState();
}

class _AfterOTPVerificationState extends State<AfterOTPVerification> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          successTicket(),
        SizedBox(
          height: 10.0,
        ),
        FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new NewRequest()));
          },
        )
        ],
      ),
    ),
    )
    );

  }
  successTicket() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    child: Material(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      borderRadius: BorderRadius.circular(4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "Thank You!",
              textColor: Colors.purple,
              subtitle: "Your Request was successful",
            ),
//            ListTile(
//              title: Text("Date"),
//              subtitle: Text("26 June 2018"),
//              trailing: Text("11:00 AM"),
//            ),
            ListTile(
              title: Text(savitem.Name),
              subtitle: Text(savitem.Mobile),
              trailing: CircleAvatar(
                radius: 20.0,
              ),
            ),
            ListTile(
              title: Text("Donation"),
              subtitle: Text(savitem.Donations),
              trailing: Text("On Completion"),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0.0,
              color: Colors.grey.shade300,
              child: RaisedButton(onPressed:(){Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new MyRequestsDisplay()));}
              ,child: Text('Add New Request')
              ),
            )
          ],
        ),
      ),
    ),
  );
}


class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;
  final textColor;
  ProfileTile({this.title, this.subtitle, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700, color: textColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }
}