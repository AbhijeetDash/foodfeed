



import 'dart:html' as prefix0;
import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:food_feed/main.dart';
import 'package:food_feed/utils/widgets.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrange,
        title: Text('Food|Feed', style: TextStyle(color: Colors.white, fontFamily: 'Raleway', fontWeight: FontWeight.w300),),
        actions: <Widget>[
          ThemeButton(
            title: "Back",
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MyHomePage()));
            },
          ),
          ThemeButton(
            title: "Publish",
            onPressed: (){},
          ),
          ThemeButton(
            title: "Draft",
            onPressed: (){},
          ),
        ],
      ),
      body : Container(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: 20),
          child: ListView(    
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 30),
                    hintText: "Title"
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 40),
                  maxLength: 40,  
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 20),
                    hintText: "Type you Recipie here"
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  maxLines: 100,
                )
              ],
            ),
          )
        ),
    );
  }
}