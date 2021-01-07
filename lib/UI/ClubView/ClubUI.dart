import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubView extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const ClubView({Key key, this.clubDoc}) : super(key: key);
  @override
  _ClubViewState createState() => _ClubViewState();
}

class _ClubViewState extends State<ClubView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 256,
              width: Get.width,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.clubDoc['CoverPhoto'],
              ),
            )
          ],
        ),
      ),

    );
  }
}
