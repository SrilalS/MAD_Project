import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mad_project/Classes/GlobleData.dart';
import 'package:mad_project/UI/ClubsList.dart';
import 'package:mad_project/UI/HomeFeed.dart';
import 'package:mad_project/UI/Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;
  PageController pageController = new PageController();
  List<String> pageNames = ['Home', 'Clubs', 'Profile'];

  FirebaseFirestore fstore = FirebaseFirestore.instance;

  void isLogged() async {
    await Firebase.initializeApp();
    if (FirebaseAuth.instance.currentUser != null) {
      print('Logged In');
    } else {
      print('Logged Out');
    }
  }

  void setUser() {
    fstore
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.email)
        .get()
        .then((value) {
      if (value.exists) {
        user = value;
      } else {
        fstore
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser.email)
            .set({
          'Admin': false,
          'Club': '',
          'Batch': 'Faculty of Computing',
          'Faculty': '19.1',
          'Clubs': [],
        });
      }
    });
  }

  @override
  void initState() {
    setUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.blue.shade800,
        systemNavigationBarColor: Colors.blue.shade800));
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.menu), label: 'Clubs'),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user), label: 'Profile'),
        ],
      ),
      body: PageView(
        onPageChanged: (pg) {
          setState(() {
            page = pg;
          });
        },
        controller: pageController,
        children: [HomeFeed(), ClubsList(), Profile()],
      ),
    );
  }
}
