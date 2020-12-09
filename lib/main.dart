import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/Auth.dart';
import 'package:mad_project/UI/FirebaseListing.dart';
import 'package:mad_project/UI/Home.dart';

void main() {
  runApp(ClubsPlus());
}

class ClubsPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return GetMaterialApp(
      title: 'Clubs Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Auth(),
    );
  }
}