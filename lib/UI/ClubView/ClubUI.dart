import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:mad_project/Classes/GlobleData.dart';
import 'package:mad_project/Styles/TextStyles.dart';
import 'package:mad_project/UI/ClubView/AdminUI.dart';
import 'package:mad_project/UI/ClubView/ClubEvents.dart';
import 'package:mad_project/UI/ClubView/ClubHomePage.dart';

class ClubView extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const ClubView({Key key, this.clubDoc}) : super(key: key);

  @override
  _ClubViewState createState() => _ClubViewState();
}

class _ClubViewState extends State<ClubView> {
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  int page = 0;
  bool isAdmin = true;
  PageController pageController = new PageController();
  List<String> pageNames = ['Home', 'Clubs', 'Profile'];
  List clubsList = user['Clubs'];

  bool isJoined = false;
  void checkifJoined() {
    if (clubsList.contains(widget.clubDoc.id)) {
      setState(() {
        isJoined = true;
      });
    }
  }

  @override
  void initState() {
    checkifJoined();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.clubDoc.id,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: page,
            onTap: (index) {
              setState(() {
                page = index;
                pageController.jumpToPage(page);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.home),
                label: 'Club Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.alignCenter), label: 'Events'),
              (user['Admin'] && user['Club'] == widget.clubDoc.id)
                  ? BottomNavigationBarItem(
                      icon: Icon(FeatherIcons.shield), label: 'Admin')
                  : BottomNavigationBarItem(
                      icon: Icon(FeatherIcons.plusCircle), label: 'Join')
            ],
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (pg) {
              setState(() {
                page = pg;
              });
            },
            children: [
              ClubHomePage(clubDoc: widget.clubDoc),
              ClubEvents(clubDoc: widget.clubDoc),
              (user['Admin'] && user['Club'] == widget.clubDoc.id)
                  ? AdminUI(clubDoc: widget.clubDoc)
                  : Container(
                      child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isJoined
                            ? Text('Leave This Club')
                            : Text('Join This Club'),
                        Center(
                          child: isJoined
                              ? RaisedButton.icon(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () {
                                    clubsList.removeWhere((element) {
                                      return element == widget.clubDoc.id;
                                    });
                                    FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(FirebaseAuth
                                            .instance.currentUser.email)
                                        .update({
                                      'Clubs': clubsList,
                                    }).then((value) {
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(FirebaseAuth
                                              .instance.currentUser.email)
                                          .get()
                                          .then((value) {
                                        user = value;
                                        setState(() {
                                          isJoined = false;
                                        });
                                        Get.snackbar(
                                            'Left from ' +
                                                widget.clubDoc['Name'],
                                            'You have left the Club ' +
                                                widget.clubDoc['Name'],
                                            colorText: Colors.white,
                                            backgroundColor: Colors.red);
                                      });
                                    });
                                  },
                                  icon: Icon(FeatherIcons.minusCircle),
                                  label: Text('Leave'),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                )
                              : RaisedButton.icon(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    clubsList.add(widget.clubDoc.id);
                                    FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(FirebaseAuth
                                            .instance.currentUser.email)
                                        .update({
                                      'Clubs': clubsList,
                                    }).then((value) {
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(FirebaseAuth
                                              .instance.currentUser.email)
                                          .get()
                                          .then((value) {
                                        user = value;
                                        Get.snackbar(
                                            'Joined ' + widget.clubDoc['Name'],
                                            'You have Joined the Club ' +
                                                widget.clubDoc['Name'],
                                            colorText: Colors.white,
                                            backgroundColor: Colors.green);
                                        setState(() {
                                          isJoined = true;
                                        });
                                      });
                                    });
                                  },
                                  icon: Icon(FeatherIcons.plusCircle),
                                  label: Text('Join'),
                                ),
                        ),
                      ],
                    )),
            ],
          )),
    );
  }
}
