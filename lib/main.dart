import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/ClubListCats.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(ClubsPlus());
}

class ClubsPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      title: 'Clubs Plus',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ClubListCats(),
      
      );
    
  }
}