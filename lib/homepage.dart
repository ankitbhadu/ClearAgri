import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'carousel.dart';
import 'homepagecard.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(

          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                // ImageCarousel(),
                CarouselWithIndicator(),
                HomepageInfoCard(),
                HomepageButtons()
              ],
            ),
          )
      ),
    );
  }
}