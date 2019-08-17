import 'package:flutter_web/material.dart';

class ThemeButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String title;
  ThemeButton({@required this.onPressed, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 6.0, top: 8.0, bottom: 8.0),
      child: RawMaterialButton(
        fillColor: Colors.orangeAccent,
        splashColor: Colors.deepOrange,
        shape: StadiumBorder(),
        padding: EdgeInsets.all(2.0),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: Colors.white,  )),
      ),
    );   
  }
}

class TopThumb extends StatelessWidget {
  final String url;
  final String topic;
  TopThumb({@required this.url, @required this.topic});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
                ),
                child: RawMaterialButton(
                  splashColor: Colors.orange,
                  shape: CircleBorder(),
                  onPressed: (){},
                ),
              ),
            ),
            Text(topic, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100, fontSize: 10, decoration: TextDecoration.none,  ),)
          ],
        ),
      ),
    );
  }
}

class Article extends StatelessWidget {

  final String url;
  final String heading;
  final String auther;
  final String sampletext;

  Article({@required this.url, @required this.heading, @required this.auther, @required this.sampletext});
  
  @override
  Widget build(BuildContext context) {
    Color likeColor = Colors.white;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top : 20.0),
      child: Container(
        height: height*0.5,
        width: width,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover
                    )
                  ),
                  width: width*0.3,
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                Container(
                  width: width*0.4,
                  color: Colors.grey[800],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(heading, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w100 , decoration: TextDecoration.none,  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(auther, style: TextStyle(color: Colors.grey[200], decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w100),),
                      ),
                      Container(
                        height: height*0.2,
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(sampletext, 
                            style: TextStyle(
                              color: Colors.white, 
                              decoration: TextDecoration.none, 
                              fontSize: 16,
                              fontWeight: FontWeight.w100
                            )
                          ),
                        )
                      ),  
                      Padding(
                        padding: const EdgeInsets.only(top:16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.star, color: likeColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.save, color: likeColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(left : 8.0),
                  child: Container(
                    height: height*0.5,
                    width: width*0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[800]
                    ),
                    child: Column(
                      children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('More by Chefman', style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 24, fontWeight: FontWeight.w100, ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Ice-Creams', style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 18, fontWeight: FontWeight.w100, ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Fast Food', style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 18, fontWeight: FontWeight.w100, ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Piper Pizza', style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 18, fontWeight: FontWeight.w100, ),),
                         ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Drawer(
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
    );
  }
}