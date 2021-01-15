import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:mad_project/Styles/TextStyles.dart';

class ClubHomePage extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const ClubHomePage({Key key, this.clubDoc}) : super(key: key);
  @override
  _ClubHomePageState createState() => _ClubHomePageState();
}

class _ClubHomePageState extends State<ClubHomePage> {
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CachedNetworkImage(
                    height: 256,
                    width: Get.width,
                    fit: BoxFit.cover,
                    imageUrl: widget.clubDoc['CoverPhoto'],
                  ),
                  Container(
                    height: 64,
                    color: Colors.white,
                  ),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: CachedNetworkImage(
                        height: 128,
                        width: 128,
                        fit: BoxFit.cover,
                        imageUrl: widget.clubDoc['Logo'],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SafeArea(
                    minimum: EdgeInsets.only(left: 8),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(64)
                      ),
                      onPressed: (){Get.back();},
                      color: Colors.white,
                      child: Icon(FeatherIcons.arrowLeft),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.clubDoc['Name'],
                style: titleTexts(Colors.black, FontWeight.bold, 24),
              )
            ],
          ),
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.clubDoc['Description'],
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: StreamBuilder(
                stream: fstore
                    .collection('HomeFeed')
                    .where('ClubID', isEqualTo: widget.clubDoc.id)
                    .where('Type',isEqualTo: 'Post')
                    .get()
                    .asStream(),
                builder: (context, snapshot) {

                  if (snapshot.connectionState != ConnectionState.done){
                    return Center(
                      child: CircularProgressIndicator(),
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
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(snapshot.data.docs[index]
                                    ['Title'], style: TextStyle(fontSize: 18),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(snapshot.data.docs[index]
                                    ['Description']),
                                  ),
                                  CachedNetworkImage(
                                    fit: BoxFit.fitWidth,
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
