import 'package:agriwaste/MyRequests.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'NewRequest.dart';
import 'homepage.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
//import 'carousel.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
int firsttime=1;
void main(){
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      home: new HomeCheck(),
//    routes: <String, WidgetBuilder>{
//      // Set routes for using the Navigator.
//      '/NewRequest': (BuildContext context) => new NewRequest(),
//    },
//      theme: ThemeData(
//        accentColor: Colors.indigo[400], // used for card headers
//        cardColor: Colors.white, // used for field backgrounds
//        backgroundColor: Colors.indigo[100], // color outside the card
//        primaryColor: Colors.teal, // color of page header
//        buttonColor: Colors.lightBlueAccent[100], // background color of buttons
//        textTheme: TextTheme(
//          button: TextStyle(color: Colors.deepPurple[900]), // style of button text
//          subhead: TextStyle(color: Colors.deepOrange[900]), // style of input text
//        ),
//      )
  )
  );
}

class HomeCheck extends StatefulWidget {
  @override
  HomeCheckState createState() => new HomeCheckState();
}

class HomeCheckState extends State<HomeCheck> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    SharedPreferences Fire
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new App()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
        child:new Image(image: AssetImage('assets/agri.png'),fit: BoxFit.fitWidth,)
        )
      ),
    );
  }
}




class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {


  int _selectedIndex = 0;
  final _widgetOptions = [
    HomePage(),
    NewRequest(),
    MyRequestsDisplay(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Center(child: new Text('ClearAGri',style: TextStyle(fontFamily:'joker'),),),),
      drawer: Drawer(),
      bottomNavigationBar: FancyBottomNavigation(

        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.send, title: "Request"),
          TabData(iconData: Icons.shopping_cart, title: "MyRequests")
        ],
        onTabChangedListener: (position) {
          setState(() {
            _selectedIndex = position;
          });
        },
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override

  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Icon(Icons.ac_unit),
        body: Text(
          'Abcd EFGHI jklmno opadfsdfsd adsdasd vgf adfdfs acasac cacacasc',
        ),
        title: Text(
          'Heading 1',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/bb.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/waiter.png',
      body: Text(
        'Abcd EFGHI jklmno opadfsdfsd adsdasd vgf adfdfs acasac cacacasc',
      ),
      title: Text('Heading 2'),
      mainImage: Image.asset(
        'assets/bb.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/taxi-driver.png',
      body: Text(
        'Abcd EFGHI jklmno opadfsdfsd adsdasd vgf adfdfs acasac cacacasc',
      ),
      title: Text('Heading 3'),
      mainImage: Image.asset(
        'assets/bb.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            firsttime=0;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => App(),
              ), //MaterialPageRoute
            );
          },
          showSkipButton:
          true, //Whether you want to show the skip button or not.
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}



