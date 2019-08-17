import 'dart:async';

import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:food_feed/src/sec.dart';
import 'package:food_feed/utils/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food|Feed',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryTextTheme: TextTheme(title: TextStyle( )),
      ),
      home: MyHomePage(title: 'Food|Feed'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyHomePage> with TickerProviderStateMixin {
  ScrollController scrollController;
  AnimationController controller;
  Animation animation; 

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    scrollController = ScrollController();
    Timer(Duration(seconds: 1), () {
      controller.forward();
    });
    super.initState();
    while(true){
      Timer(Duration(seconds: 4), ()=>{

      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        width: width,
        color: Colors.grey[800],
        child: Container(
          color: Colors.grey[800],
          width: width * 0.7,
          child: Scrollbar(
            child: Container(
              width: width * 0.3,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.deepOrange,
                    title: Row(
                      children: <Widget>[
                        Text("Food|Feed", style: TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                    elevation: 0.0,
                    actions: <Widget>[
                      FadeTransition(
                        opacity: animation,
                        child: ThemeButton(
                            title: "About", onPressed: () {}),
                      ),
                      FadeTransition(
                        opacity: animation,
                        child: ThemeButton(
                            title: "Login",
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Seq(name: "Login")));
                            }),
                      ),
                      FadeTransition(
                        opacity: animation,
                        child: ThemeButton(
                            title: "Sign-up",
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => Seq(
                                            name: "Join us",
                                          )));
                            }),
                      ),
                      FadeTransition(
                          opacity: animation,
                          child: ThemeButton(
                              title: "Settings", onPressed: () {})),
                    ],
                  ),
                  Container(
                    color: Colors.deepOrange,
                    child: Row(
                      children: <Widget>[
                        Container(
                          color: Colors.deepOrange,
                          width: width * 0.700,
                          height: 100,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                TopThumb(
                                  url:
                                      "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                  topic: "Bigger Burgers",
                                ),
                                TopThumb(
                                  url:
                                      "https://images.pexels.com/photos/913136/pexels-photo-913136.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                  topic: "Ice-Creams",
                                ),
                                TopThumb(
                                  url:
                                      "https://images.pexels.com/photos/704569/pexels-photo-704569.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                  topic: "Breakfast Time",
                                ),
                                TopThumb(
                                  url:
                                      "https://images.pexels.com/photos/374757/pexels-photo-374757.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                  topic: "Natural Coffee",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          color: Colors.deepOrange,
                          width: width * 0.300,
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 300,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    hintStyle: TextStyle(),
                                    fillColor: Colors.grey[200],
                                    filled: true
                                  ),
                                  style: TextStyle(
                                      fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                child: RawMaterialButton(
                                  constraints: BoxConstraints(
                                      minWidth: 50,
                                      maxWidth: 50,
                                      maxHeight: 50,
                                      minHeight: 50),
                                  shape: CircleBorder(),
                                  onPressed: () {},
                                  child: Icon(Icons.search,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: height - 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.pexels.com/photos/1565982/pexels-photo-1565982.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      width: width,
                      height: height - 100,
                      alignment: Alignment.centerLeft,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      child: Container(
                        height: height * 0.4,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FadeTransition(
                              opacity: animation,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: width * 0.3),
                                child: Image(
                                    image: AssetImage('fl.png'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            FadeTransition(
                              opacity: animation,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 00, right: 20),
                                child: Container(
                                  width: width * 0.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('- Spices -', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic ", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white), textAlign: TextAlign.center,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height,
                    color: Colors.grey[200],
                  
                  ),
                ],
              )
            )
          )
        )
      ),
    );
  }
}