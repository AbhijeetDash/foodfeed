import 'dart:async';

import 'package:flutter_web/material.dart';
import 'package:food_feed/main.dart';
import 'package:food_feed/src/sec.dart';
import 'package:food_feed/src/setup.dart';
import 'package:food_feed/utils/functions.dart';
import 'package:food_feed/utils/widgets.dart';

class InfoGetter extends StatefulWidget {
  final String email;
  final String password;

  InfoGetter({@required this.email, @required this.password});

  @override
  _InfoGetterState createState() => _InfoGetterState(
    email: email,
    password: password
  );
}

class _InfoGetterState extends State<InfoGetter> {
  final String email;
  final String password;

  TextEditingController _name;
  TextEditingController _url;

  _InfoGetterState({@required this.email, @required this.password});

  @override
  void initState() {
    _name = TextEditingController();
    _url = TextEditingController();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrange,
        title: Text('Food|Feed', style: TextStyle(color: Colors.white, fontFamily: 'Raleway', fontWeight: FontWeight.w300),),
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1544510807-d0289d40b17c?ixlib=rb-1.2.1&auto=format&fit=crop&w=746&q=80'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0.7),
          width: width,
          height: height,
          child: Center(
            child: Container(
              width: width * 0.4,
              height: height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Personalize", style: TextStyle(color: Colors.black, fontFamily: 'Raleway', fontWeight: FontWeight.w800, fontSize: 40)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100, top: 12.0),
                    child: TextField(
                      controller: _name,
                      focusNode: FocusNode(),
                      decoration: InputDecoration(
                        hintText: "enter your Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100, top: 12.0),
                    child: TextField(
                      controller: _url,
                      decoration: InputDecoration(
                        hintText: "Url for Profile Picture",
                      ),
                    ),
                  ),
                  ThemeButton(
                    title: "Save",
                    onPressed: (){
                      create(this.email,this.password,_name.text,_url.text).then((onValue){
                        if(onValue == true){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> 
                            Setup(
                              logs: true,
                              email: email,
                              name: _name.text,
                              pic: _url.text
                            )
                          ));
                        } else {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Seq(action: "Join Us", error: true, errMsg: "Email already exists!\nPlease use another email of you",)));
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}