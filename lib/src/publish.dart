import 'package:flutter_web/material.dart';
import 'package:food_feed/src/article.dart';
import 'package:food_feed/utils/functions.dart';
import 'package:food_feed/utils/widgets.dart';

class Publish extends StatefulWidget {
  final String title;
  final String content;
  final String email;

  Publish({@required this.title, @required this.content, @required this.email});

  @override
  _PublishState createState() => _PublishState(title: title, content: content, email: email);
}

class _PublishState extends State<Publish> {
  final String title;
  final String content;
  final String email;

  TextEditingController _url;


  _PublishState({@required this.title, @required this.content, @required this.email});

  @override
  void initState() {
    _url = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Publish'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1544510807-d0289d40b17c?ixlib=rb-1.2.1&auto=format&fit=crop&w=746&q=80'),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            width: width,
            height: height,
            color: Color.fromRGBO(0, 0, 0, 0.7),
          ),
          Center(
            child: Container(
              width: width * 0.5,
              height: height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100, top: 12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _url,
                      decoration: InputDecoration(
                        hintText: "enter image URL",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100, top: 12.0),
                    child: ThemeButton(
                      title: "Publish",
                      onPressed: (){
                        String a = _url.text;
                        publish(title, content, a, email);
                        Navigator.of(context).pop(this);
                        Navigator.of(context).pop(MaterialPageRoute(builder: (context)=> Editor(email:"")));
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}