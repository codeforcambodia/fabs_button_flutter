import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  int _counter = 0;

  AnimationController _animationController;
  Animation degOneTranslationAnimation;

  double getRadienFromDegree(double degree){
    double unitRadien = 57.295779513;
    return degree / unitRadien;
  }

  bool _visible = false;
  
  @override
  void initState(){

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    super.initState();
    _animationController.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        // child: 
        // Stack(
        //   children: <Widget>[
        //     Positioned(
        //       right: (size.width/2)-25,
        //       bottom: 30,
        //       child: ,
        //     )
        //   ],
        // ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              // CircularButton(
              //   width: 50, height: 50.0,
              //   color: Colors.blue,
              //   icon: Icon(Icons.camera),
              // ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _visible ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset.fromDirection(getRadienFromDegree(270), degOneTranslationAnimation.value * 60),
                          child: CircularButton(
                            width: 50, height: 50.0,
                            color: Colors.blue,
                            icon: Icon(Icons.camera),
                          )
                        ),
                      ),

                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _visible ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset.fromDirection(getRadienFromDegree(270), degOneTranslationAnimation.value * 120),
                          child: CircularButton(
                            width: 50, height: 50.0,
                            color: Colors.blue,
                            icon: Icon(Icons.camera),
                          )
                        ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: _visible ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset.fromDirection(getRadienFromDegree(270), degOneTranslationAnimation.value * 180),
                          child: CircularButton(
                            width: 50, height: 50.0,
                            color: Colors.blue,
                            icon: Icon(Icons.camera),
                          )
                        ),
                      ),
                      // CircularButton(
                      //   width: 50, height: 50.0,
                      //   color: Colors.lightBlue,
                      //   icon: Icon(Icons.share),
                      // ),
                      // CircularButton(
                      //   width: 50, height: 50.0,
                      //   color: Colors.green,
                      //   icon: Icon(Icons.camera),
                      // ),
                      CircularButton(
                        width: 60, height: 60.0,
                        color: Colors.brown,
                        icon: Icon(Icons.menu),
                        onClick: (){
                          print("Click");
                          print(degOneTranslationAnimation.value);
                          if (_animationController.isCompleted){
                            _animationController.reverse();
                          } else {
                            _animationController.forward();
                          }
                          setState(() {
                            
                            if (_visible){ 
                              _visible = false;
                            } else  if (_visible == false) {
                              _visible = true;
                            }
                          });
                        },
                      ),
                    ],
                  )
                )
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      CircularButton(
                        width: 50, height: 50.0,
                        color: Colors.blue,
                        icon: Icon(Icons.camera),
                      ),
                      // CircularButton(
                      //   width: 50, height: 50.0,
                      //   color: Colors.lightBlue,
                      //   icon: Icon(Icons.share),
                      // ),
                      // CircularButton(
                      //   width: 50, height: 50.0,
                      //   color: Colors.green,
                      //   icon: Icon(Icons.camera),
                      // ),
                      // CircularButton(
                      //   width: 60, height: 60.0,
                      //   color: Colors.brown,
                      //   icon: Icon(Icons.menu),
                      // ),
                    ],
                  )
                )
              ),
              Expanded(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: _visible ? 1.0 : 0.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: <Widget>[
                        CircularButton(
                          width: 50, height: 50.0,
                          color: Colors.blue,
                          icon: Icon(Icons.camera),
                        ),
                        // CircularButton(
                        //   width: 50, height: 50.0,
                        //   color: Colors.lightBlue,
                        //   icon: Icon(Icons.share),
                        // ),
                        // CircularButton(
                        //   width: 50, height: 50.0,
                        //   color: Colors.green,
                        //   icon: Icon(Icons.camera),
                        // ),
                        // CircularButton(
                        //   width: 60, height: 60.0,
                        //   color: Colors.brown,
                        //   icon: Icon(Icons.menu),
                        // ),
                      ],
                    )
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton({this.color, this.width, this.height, this.icon, this.onClick});


  @override
  Widget build(BuildContext context) {
    return IconButton(icon: icon,enableFeedback: true, onPressed: onClick);
  }
}
