import 'dart:async';

import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:food_feed/src/sec.dart';
import 'package:food_feed/utils/widgets.dart';

import 'src/sec.dart';

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
    int itemCount = 7;
    return Scaffold(
      drawer: Drawer(
      elevation: 16.0,
      child: Scrollbar(
        child: ListView(
          children: <Widget>[
            Container(
              height: height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=353&q=80'),
                    fit: BoxFit.cover
                  )
                ),
              child: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                child: Center(
                  child: ListTile(
                    title: CircleAvatar(
                      radius: 50,
                      child: Text('Food|Feed',style:TextStyle(fontSize: 50)),
                    ),
                  ),
                )
              ),
            ),
            ListTile(
              leading: Icon( Icons.favorite,size: 20),
              title: Text('Favourite',style: TextStyle(fontSize: 15)),
              subtitle: Text('Find your liked Recepies!',style: TextStyle(fontSize: 12)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.low_priority,size: 20),
              title: Text('Stats',style: TextStyle(fontSize: 15)),
              subtitle: Text("Find who's liking your reciepies",style: TextStyle(fontSize: 12)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.new_releases,size: 20),
              title: Text('New Recepie',style: TextStyle(fontSize: 15)),
              subtitle: Text('Got new ideas? How about writing!',style: TextStyle(fontSize: 12)),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                height: 0.5,
                color: Colors.grey,
              ),
            ),
            ThemeButton(
              title: "Logout!",
              onPressed: () {},
            ),
            Container(
              height: 20,
              child: Center(
                child: Text('Privacy policies || Terms of use',style: TextStyle(fontSize: 20,  ))
              )
            ),
          ],
        ),
      ),
    ),
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
                      ThemeButton(
                            title: "About", onPressed: () {}),
                      
                       ThemeButton(
                            title: "Login",
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Seq(name: "Login")));
                            }),
                      
                      ThemeButton(
                            title: "Sign-up",
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => Seq(
                                            name: "Join us",
                                          )));
                            }),
                      
                       ThemeButton(
                              title: "Settings", onPressed: () {}),
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemCount,
                      itemBuilder: (context,i){
                        if(i == 0){
                          return Container(
                            width: width*0.4,
                            height: height,
                            alignment: Alignment.center,
                            child: Text('Dishes to Explore ->', style:TextStyle(color: Colors.black, fontSize: 30, fontStyle: FontStyle.italic))
                          );
                        } else if(i == itemCount-1){
                          return Container(
                            width: width*0.4,
                            height: height,
                            alignment: Alignment.center,
                            child: Text("You've read everythin? \n Try cooking something!", style:TextStyle(color: Colors.black, fontSize: 30, fontStyle: FontStyle.italic))
                          );
                        } else {
                          return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: width*0.3,
                            height: 400,
                            color: Colors.black,
                          ));
                        }
                      }
                    ),
                  )
                ],
              )
            )
          )
        )
      ),
    );
  }
}