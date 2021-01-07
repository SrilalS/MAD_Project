import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:mad_project/Styles/TextStyles.dart';

class ClubView extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const ClubView({Key key, this.clubDoc}) : super(key: key);

  @override
  _ClubViewState createState() => _ClubViewState();
}

class _ClubViewState extends State<ClubView> {
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  int page = 0;
  PageController pageController = new PageController();
  List<String> pageNames = ['Home','Clubs','Profile'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
            pageController.jumpToPage(page);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: 'Club Home',),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.alignCenter), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.plusCircle), label: 'Join')
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          SingleChildScrollView(
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
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.clubDoc['Name'],
                      style: titleTexts(Colors.black, FontWeight.bold, 32),
                    )
                  ],
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
                                          padding: const EdgeInsets.all(4),
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
          ),
          SingleChildScrollView(
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
                                          padding: const EdgeInsets.all(4),
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
          ),
          Container(),
        ],
      )
    );
  }
}
