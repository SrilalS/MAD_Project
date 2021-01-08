import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
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
          isAdmin ?
          BottomNavigationBarItem(icon: Icon(FeatherIcons.shield), label: 'Admin') :
          BottomNavigationBarItem(icon: Icon(FeatherIcons.plusCircle), label: 'Join')


        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (pg){
          setState(() {
            page = pg;
          });
        },
        children: [
          ClubHomePage(clubDoc: widget.clubDoc),
          ClubEvents(clubDoc: widget.clubDoc),
          isAdmin ? AdminUI() :
          Container(),
        ],
      )
    );
  }
}
