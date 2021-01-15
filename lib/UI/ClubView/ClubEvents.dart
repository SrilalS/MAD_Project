import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubEvents extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const ClubEvents({Key key, this.clubDoc}) : super(key: key);
  @override
  _ClubEventsState createState() => _ClubEventsState();
}

class _ClubEventsState extends State<ClubEvents> {
  FirebaseFirestore fstore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8),
              child: StreamBuilder(
                stream: fstore
                    .collection('HomeFeed')
                    .where('ClubID', isEqualTo: widget.clubDoc.id)
                    .where('Type',isEqualTo: 'Event')
                    .get()
                    .asStream(),
                builder: (context, snapshot) {

                  if (snapshot.connectionState != ConnectionState.done){
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: LinearProgressIndicator(),
                          )
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Card(
                            elevation: 8,
                            child: InkWell(
                              splashColor: Colors.blue,
                              onTap: () async{
                                await launch(snapshot.data.docs[index]
                                ['Link']);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(snapshot.data.docs[index]
                                    ['Title'],
                                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(snapshot.data.docs[index]
                                    ['Description']),
                                  ),
                                  CachedNetworkImage(
                                    fit: BoxFit.fitHeight,
                                    width: Get.width,
                                    height: 256,
                                    imageUrl: snapshot.data.docs[index]
                                    ['Photo'],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
