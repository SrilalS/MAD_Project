import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/Styles/TextStyles.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth fauth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  height: 128,
                  width: 128,
                  fit: BoxFit.cover,
                  imageUrl: fauth.currentUser.photoURL,
                ),
              )
            ],
          ),
          Text(fauth.currentUser.displayName, style: titleTexts(Colors.black, FontWeight.bold, 24),),
          Text(fauth.currentUser.email, style: titleTexts(Colors.black, FontWeight.normal, 24),),
        ],
      ),
    );
  }
}
