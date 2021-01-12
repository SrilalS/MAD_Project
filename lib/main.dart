import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/Editprofile.dart';
import 'package:mad_project/UI/Viewprofile.dart';

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
      home: Viewprofile(
        clubName: "ViewProfile",
        description: "desc",
        imgUrl:
            "https://www.nsbm.ac.lk/wp-content/uploads/2019/08/footer_logo.png",
      ),
    );
  }
}
