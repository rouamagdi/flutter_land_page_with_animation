

import 'package:flutter/material.dart';

import 'package:skype/delay_animation.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skype',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Tajawal',
      
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color backgroundColor = Colors.black;
Color darkerColor = Colors.black;

class _MyHomePageState extends State<MyHomePage> {
  ScrollController? _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController!.hasClients ? _scrollController!.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: RepaintBoundary(
              child: Image.asset(
                'images/sky2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0.2 * screenHeight,
            left: 0,
            right: 0,
            child: MainText(),
          ),
     
          Header(),
          Positioned(
            top: screenHeight * 0.55 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight  * 0.77,
            child: RepaintBoundary(
              child: Image.asset(
                'images/sand.png',
            
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight * 0.2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 1],
                  colors: [backgroundColor.withOpacity(0), backgroundColor],
                ),
              ),
            ),
          ),
//              Positioned(
//                top: screenHeight * 0.95 - 1 * offset,
//                left: 0,
//                right: 0,
//                height: screenHeight / 3,
//                child: Container(
//                  height: screenHeight / 3,
//                  width: double.infinity,
//                  color: backgroundColor,
//                ),
//              ),
          Scrollbar(
            child: ListView(
              cacheExtent: 64,
              controller: _scrollController,
              children: <Widget>[
                Container(height: screenHeight),
                Container(
                  height: 100,
                  color: backgroundColor,
                ),
                Container(
                  color: backgroundColor,
                  child: Page1(),
                ),
             // Page2(),
                // Page3(),
                Container(
                  height: 100,
                  color: darkerColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final int delayedAmount = 500;
  @override
  Widget build(BuildContext context) {
    return   DelayedAnimation(child:Padding(
      padding: const EdgeInsets.all(64),
      child: Row(
        children: <Widget>[
        
          Text('Skype',  style: TextStyle(
            fontFamily: "Tajawal",
            fontSize: 30,
            fontWeight: FontWeight.bold,)),
          Spacer(),
          if (MediaQuery.of(context).size.width > 900) ...[
            Text('About Us',  style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,)),
            SizedBox(width: 32),
            Text('Solution',  style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,)),
            SizedBox(width: 32),
            Text('Services',  style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,)),
            SizedBox(width: 32),
            Text('Resources',  style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,)),
            SizedBox(width: 32),
            Text('Contact Us',  style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,)),
            SizedBox(width: 64),
          ],
         Container(color: Colors.white.withOpacity(.8),
          child:Padding(padding: EdgeInsets.all(10),child: Text("Join Us",  style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,))),) 
            ],
      ),
    ),delay: delayedAmount+200,);
  }
}

class MainText extends StatelessWidget {
  final int delayedAmount = 500;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       
        SizedBox(height: 100),
      
   DelayedAnimation(child:
        Text(
          'Explore the Sky',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 100 : 40,
          ),
        ),delay: delayedAmount+700,)
       
       
       
      
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  final int delayedAmount = 500;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        children: <Widget>[
        
          SizedBox(height: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                 DelayedAnimation(child:  Text(
                'With Augmented Reality we give life \nto your imagination',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),delay: delayedAmount+500,)
            
            ],
          ),
      
          SizedBox(height: height * 0.50),
        ],
      ),
    );
  }
}

