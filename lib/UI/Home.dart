import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
  List<String> pageNames = ['Home','Clubs','Profile'];

  void isLogged() async {
    await Firebase.initializeApp();
    if (FirebaseAuth.instance.currentUser != null) {
      print('Logged In');
    } else {
      print('Logged Out');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageNames[page]),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
            pageController.jumpToPage(page);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.menu), label: 'Clubs'),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.user), label: 'Profile')
        ],
      ),
      body:  PageView(
          controller: pageController,
          children: [
            HomeFeed(),
            ClubsList(),
            Profile()
          ],
        ),
    );
  }
}
