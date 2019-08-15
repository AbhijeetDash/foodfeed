



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
          )
        ],
      ),
    );
  }
}