
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:core';


class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      autoplay: true,

      boxFit: BoxFit.cover,
      images: [
        new Image(image: AssetImage("assets/otp-icon.png"),),
        new NetworkImage('https://cdn-images-1.medium.com/max/1600/1*6xT0ZOACZCdy_61tTJ3r1Q.png'),
        new NetworkImage('https://cdn-images-1.medium.com/max/1600/1*6xT0ZOACZCdy_61tTJ3r1Q.png'),
        new NetworkImage('https://cdn-images-1.medium.com/max/1600/1*6xT0ZOACZCdy_61tTJ3r1Q.png'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
      dotSize: 5,
      overlayShadow: true,

    );

    Widget banner = new Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)),
          color: Colors.amber.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(10.0),
        child: new Text(
          'Abcdef asdad adasd',
          style: TextStyle(
            fontFamily: 'fira',
            fontSize: animation.value,//18.0,
            //color: Colors.white,
          ),
        ),
      ),
      // ),
      //  ),
    );

    return new
    Container(
      padding: const EdgeInsets.all(20.0),
      height: screenHeight / 2.5,
      child: new ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: new Stack(
          children: [
            carousel,
            banner,
          ],
        ),
      ),
    );

  }

  dispose() {
    controller.dispose();
    super.dispose();
  }



}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  final imgList =[
    new Image(image: AssetImage("assets/cropimg.jpg"),),
    new Image(image: AssetImage("assets/cropimg.jpg"),),
    new Image(image: AssetImage("assets/cropimg.jpg"),),
    new Image(image: AssetImage("assets/cropimg.jpg"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
        CarouselSlider(
          items: imgList,
          height: 220,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          //autoPlayCurve: Curve.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: true,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          scrollDirection: Axis.horizontal,

        ),

        Padding(
          padding: EdgeInsets.only(top: 210),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: _current == 0 ? 8:6.5,
                height: _current == 0 ? 8:6.5,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == 0 ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                ),
              ),
              Container(
                width: _current ==1 ? 8:6.5,
                height: _current == 1 ? 8:6.5,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == 1 ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                ),
              ),
              Container(
                width: _current == 2 ? 8:6.5,
                height: _current == 2 ? 8:6.5,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == 2 ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                ),
              ),
              Container(
                width: _current == 3 ? 8:6.5,
                height: _current == 3 ? 8:6.5,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == 3 ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                ),
              ),
            ],
          ),

        )
      ],
    );
  }
}