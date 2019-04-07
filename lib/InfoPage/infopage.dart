import 'package:flutter/material.dart';
import 'cabout.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileOnePage extends StatelessWidget {
  var deviceSize;

  //Column1
  Widget profileColumn() => Container(
    height: deviceSize.height * 0.24,
    child: FittedBox(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "ClearAgri",
              subtitle: "Contact",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        color: Colors.black,
                        onPressed: () {launch('mailto:clearagri@gmail.com?subject=General%20Query');},
                      ),
                      Text('Email Us',style: TextStyle(fontSize: 10),),
                    ],

                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(40.0)),
                      border: new Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/cropimg.jpg'),
                      foregroundColor: Colors.black,
                      radius: 30.0,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.call),
                        color: Colors.black,
                        onPressed: () {launch('tel:12345678');},
                      ),
                      Text('Call Now',style: TextStyle(fontSize: 10),),
                    ],

                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

  //column2

  //column3
  Widget descColumn() => Container(
    height: deviceSize.height * 0.13,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Text(
          "information regarding our app and motto of company",
          style: TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
          maxLines: 3,
          softWrap: true,
        ),
      ),
    ),
  );
  //column4
  Widget accountColumn() => FittedBox(
    fit: BoxFit.fill,
    child: Container(
      height: deviceSize.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(

                  child: ProfileTile(
                    title: "Website",
                    subtitle: "clearagri.com",
                  ),
                  onTap: (){_launchURL();},
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(

                  child: ProfileTile(
                    title: "Phone",
                    subtitle: "+tollfreenumber",
                  ),
                  onTap: (){launch('tel:12345678');},
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(

                  child: ProfileTile(
                    title: "Youtube",
                    subtitle: "youtubelink",
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),),
          FittedBox(
            fit: BoxFit.cover,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ProfileTile(
                  title: "Location",
                  subtitle: "Punjab",
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(

                  child: ProfileTile(
                    title: "Email",
                    subtitle: "clearagri@gmail.com",
                  ),
                  onTap: () {launch('mailto:clearagri@gmail.com?subject=General%20Query');},
                ),
                SizedBox(
                  height: 10.0,
                ),
                ProfileTile(
                  title: "Facebook",
                  subtitle: "fblink.fb",
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget bodyData() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          profileColumn(),
          Divider(
            color: Colors.grey.shade300,
            height: 8.0,
          ),


          descColumn(),
          Divider(
            color: Colors.grey.shade300,
            height: 8.0,
          ),
          accountColumn()
        ],
      ),
    );
  }

  Widget _scaffold() => CommonScaffold(
    appTitle: "View Profile",
    bodyData: bodyData(),
    showFAB: true,
    showDrawer: true,
    floatingIcon: Icons.person_add,
  );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }
}
_launchURL() async {
  const url = 'https://clearagri.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}