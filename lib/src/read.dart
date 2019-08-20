import 'package:flutter_web/material.dart';
import 'package:food_feed/main.dart';
import 'package:food_feed/utils/widgets.dart';



class Reader extends StatefulWidget {
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up, color: Colors.white,),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}