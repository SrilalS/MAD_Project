import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/ListX.dart';

class FBListing extends StatefulWidget {
  @override
  _FBListingState createState() => _FBListingState();
}

class _FBListingState extends State<FBListing> {
  FirebaseFirestore fbDB = FirebaseFirestore.instance;

  TextEditingController cname = TextEditingController();

  void addClub(String id, String name) async{
    cname.text = name;
    Get.dialog(AlertDialog(
        title: Text(id),
        content: Column(
          children: [
            TextField(
              
              controller: cname,
            )
          ],
        ),
      actions: [
        FlatButton(
          child: Text('Add'),
          onPressed: (){
            fbDB.collection('Clubs').doc(id).set({
              'Name': cname.text,
            }
            ).then((value) => Navigator.pop(context));
          },
        )
      ],
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RaisedButton(
          onPressed: (){
            //addClub();
          },
        ),
      ),
      body: Container(
        height: Get.height*0.5,
        width: Get.width,
        child: StreamBuilder(
          stream: fbDB.collection('Clubs').snapshots(),
          builder: (context, examplescollection) {
            if (examplescollection.data != null) {
              return ListView.builder(
                itemCount: examplescollection.data.documents.length,
                itemBuilder: (_, int index) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    height: 128,
                    child: Card(
                        elevation: 8,
                        child:Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CachedNetworkImage(
                                width: Get.width,
                                fit: BoxFit.fitWidth,
                                  imageUrl: 'https://picsum.photos/200/300'
                              ),

                                ClipRRect(
                                  child: BackdropFilter(
                                    child:Container(
                                        width: Get.width,
                                        height: 64,
                                        color: Colors.white.withOpacity(0.1)),
                                    filter: ImageFilter.blur(
                                        sigmaY: 5,
                                        sigmaX: 5
                                    ),
                                  ),
                                ),

                              ListTile(
                                title: Text(examplescollection
                                    .data.documents[index]['Name']),
                              ),
                              RaisedButton(
                                elevation: 0,
                                child: Text('View'),
                                onPressed: () {
                                  addClub(examplescollection.data.documents[index].id, examplescollection.data.documents[index]['Name']);
                                   //   Get.to(ListX(
                                   //     docID:
                                   //     examplescollection.data.documents[index].id,
                                   //   ));
                                },
                              ),
                            ],
                          ),
                        ),
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
