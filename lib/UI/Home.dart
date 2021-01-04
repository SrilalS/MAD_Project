import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  void isLogged() async{
    await Firebase.initializeApp();
    if (FirebaseAuth.instance.currentUser != null){
      print('Logged In');
    } else {
      print('Logged Out');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
