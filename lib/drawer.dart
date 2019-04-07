import 'package:flutter/material.dart';
import 'newpage.dart';


class NewDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Farmer"),
            accountEmail: new Text("8796392312"),
            decoration: BoxDecoration(
                color: Colors.teal
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.tealAccent,
            ),

          ),

          new Divider(),
          new ListTile(
            title: new Text("Profile"),
            leading: new Icon(Icons.chrome_reader_mode),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new NewPage("profile")));
            },
          ),

          new Divider(),
          new ListTile(
            title: new Text("Track My Request"),
            leading: new Icon(Icons.book),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new NewPage("route")));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("Report"),
            leading: new Icon(Icons.report),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new NewPage("route")));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("Settings"),
            leading: new Icon(Icons.settings),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new NewPage("Settings")));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("Help & Feedback"),
            leading: new Icon(Icons.help),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new NewPage("call me")));
            },
          ),

        ],
      ),
    );
  }
}