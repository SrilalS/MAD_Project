import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/Home.dart';

void main() {
  runApp(ClubsPlus());
}

class ClubsPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clubs Plus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}