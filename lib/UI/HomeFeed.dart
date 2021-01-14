import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/Styles/TextStyles.dart';

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  QuerySnapshot qsnap;

  void getClubs() async {
    await fstore.collection('Clubs').get().then((value) {
      setState(() {
        qsnap = value;
      });
    });
  }

  @override
  void initState() {
    getClubs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fstore.collection('HomeFeed').get().asStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done ||
            qsnap.isBlank) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          //shrinkWrap: true,
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
                    onTap: (){},
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 72,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: 48,
                                    height: 48,
                                    imageUrl: qsnap.docs.where((element) => element.id == snapshot.data.docs[index]['ClubID']).first['Logo'],
                                  ),
                                ),
                                SizedBox(width: 4),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 256,
                                        child: Text(
                                          snapshot.data.docs[index]['Title'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: titleTexts(
                                              Colors.black, FontWeight.normal, 16),
                                        ),
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('by '+qsnap.docs.where((element) => element.id == snapshot.data.docs[index]['ClubID']).first['Name'])
                                        ],),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(snapshot.data.docs[index]['Description']),
                          ),
                          CachedNetworkImage(
                            fit: BoxFit.fitWidth,
                            width: Get.width,
                            height: 256,
                            imageUrl: snapshot.data.docs[index]['Photo'],
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
    );
  }
}
