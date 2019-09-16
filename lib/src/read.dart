import 'package:flutter_web/material.dart';
import 'package:food_feed/utils/widgets.dart';



class Reader extends StatefulWidget {

  //Url is pic behind article;
  //Pic is writter profile pic;

  final String title;
  final String content;
  final String url;
  final String writter;
  final String pic;

  Reader({@required this.title, @required this.content, @required this.writter, @required this.url, @required this.pic});

  @override
  _ReaderState createState() => _ReaderState(title: title, content: content, writter: writter, url: url, pic: pic);
}

class _ReaderState extends State<Reader> {
  final String title;
  final String content;
  final String url;
  final String writter;
  final String pic;

  _ReaderState({@required this.title, @required this.content, @required this.writter, @required this.url, @required this.pic});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrange,
        title: Text('Food|Feed', style: TextStyle(color: Colors.white, fontFamily: 'Raleway', fontWeight: FontWeight.w300),),
        actions: <Widget>[
          ThemeButton(
            title: "Back",
            onPressed: (){
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Container(
              height: height/2,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                width: width,
                height: height/2,
                color: Color.fromRGBO(0, 0, 0, 0.8),
                child: Center(
                  child: Text(title, style: TextStyle(color: Colors.white, fontSize: 40)),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: width * 0.1, right: width * 0.1, bottom: 100),
                child: Container(
                  child: Text(content,style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)
                ),
              ),
            ),
            Container(
              width: width,
              height: 200,
              color: Colors.grey[700],
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(pic),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Written by : ", style: TextStyle(color:Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(writter, style: TextStyle(fontSize: 20, color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up, color: Colors.white,),
        backgroundColor: Colors.deepOrange,
        onPressed: (){},
      ),
    );
  }
}