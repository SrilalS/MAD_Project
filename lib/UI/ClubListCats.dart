import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClubList extends StatefulWidget {
  @override
  _ClubListState createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {

  FirebaseFirestore fDB = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Expanded(
            flex:1,
            child: StreamBuilder(
              stream: fDB.collection('Clubs').snapshots(),
              builder: (context, clubCats){
                return ListView.builder(
                  itemCount: clubCats.data.documents.length,
                  itemBuilder: (_, int index){
                    return ListTile(
                      title: clubCats.data.documents[index]['Name'],
                    );
                  },
                );
              },
            )
            )
        ]
      ),
    );
  }
}