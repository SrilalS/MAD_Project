import 'package:flutter/material.dart';
import 'package:mad_project/config/palette.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> containers = [
    Container(
      color: Colors.blue[400],
    ),
    Container(
      color: Colors.blue[400],
    ),
    Container(
      color: Colors.blue[400],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: null,
      body: new ListView(
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://www.htmlcsscolor.com/preview/gallery/33DFFF.png'))),
                    ))
                  ],
                ),
                Positioned(
                    top: 80.0,
                    child: Container(
                        height: 190.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png')),
                            border:
                                Border.all(color: Colors.black, width: 6.0))))
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 170.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Rotract Club',
                  style: TextStyle(
                      color: Palette.nsbmgreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: -1.2),
                ),
                SizedBox(
                  width: 5.0,
                ), // Icon(Icons.person, color: Colors.blueAccent,)
              ],
            ),
          ),
        ],
      ),
    );
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('hello'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: '2020',
                ),
                Tab(
                  text: '2021',
                ),
                Tab(
                  text: '2022',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: containers,
          ),
        ),
      ),
    );
  }
}
