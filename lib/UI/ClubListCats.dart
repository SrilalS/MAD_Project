import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClubList extends StatefulWidget {
  @override
  _ClubListState createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {


 
  FirebaseFirestore fDB = FirebaseFirestore.instance;
  @override
  void initState(){
  
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("test"),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children:[
          Expanded(
            flex:1,
            child: StreamBuilder(
              stream: fDB.collection('clubCats').snapshots(),
              builder: (context, clubCats){
                return ListView.builder(
                  itemCount: clubCats.data.documents.length,
                  itemBuilder: (context, int index){
                    return ListTile(
                      onTap: (){},
                      title: Text(clubCats.data.documents[index]['Name'].toString()),
                      
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