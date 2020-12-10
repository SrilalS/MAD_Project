import 'package:flutter/material.dart';

class ViewClub extends StatefulWidget {

  final String clubID;
  final String clubCat;

  const ViewClub({Key key, this.clubID, this.clubCat}) : super(key: key);

  @override
  _ViewClubState createState() => _ViewClubState();
}

class _ViewClubState extends State<ViewClub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         elevation: 0.0,
          backgroundColor: Color(0xFF00B0FF),
           leading: IconButton(
            icon: Icon(Icons.arrow_back),
               onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     TextField(
                          decoration: InputDecoration(
                                hintText: 'Club Name',
                                
                          ),
                        )
                      
                    ]
                  ),
                ),
              ]
            ),
          ),
      
        ]
      )
    );      
                
  }
}