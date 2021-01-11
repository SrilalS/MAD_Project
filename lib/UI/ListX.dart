import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListX extends StatefulWidget {

  final String docID;

  const ListX({Key key, this.docID}) : super(key: key);

  @override
  _ListXState createState() => _ListXState();
}

class _ListXState extends State<ListX> {
  FirebaseFirestore fbDB = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: Get.height,
        width: Get.width,
        child: StreamBuilder(
          stream: fbDB.collection('Clubs').doc(widget.docID).collection('ClubList').snapshots(),
          builder: (context, examplescollection){

            if (examplescollection.data != null){
              return ListView.builder(
                itemCount: examplescollection.data.documents.length,
                itemBuilder: (_, int index){
                  return ListTile(
                    onTap: (){
                      //Get.to(ListX(docID: examplescollection.data.documents[index].id,));
                    },
                    title: Text(examplescollection.data.documents[index]['Name']),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
