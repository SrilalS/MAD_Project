import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/Home.dart';
import 'package:mad_project/UI/home_screen.dart';
import 'package:mad_project/UI/nav_screens.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(ClubsPlus());
}

class ClubsPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clubs Plus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavScreen(),
    );   
  }
}