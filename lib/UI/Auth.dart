import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mad_project/Styles/TextStyles.dart';
import 'package:mad_project/UI/AuthWidgets/MainLogo.dart';

import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  Widget switcher = Text('SignIn With Google');

  void signInWithGoogle() async {
    setState(() {
      switcher = Container(
        height: 28,
        width: 28,
        child: CircularProgressIndicator(backgroundColor: Colors.white),
      );
    });
    try {
      GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      //Get.offAll(Scafolding());
      setState(() {
        switcher = Text('Login with Google');
      });
    } catch (e) {
      Get.snackbar(
        'Login Failed!',
        'Login Failed please retry',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        icon: Icon(Icons.error, color: Colors.white,),
      );
      setState(() {
        switcher = Text('Login with Google');
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            mainLogo(),
            Container(
              height: 128,
              width: Get.width*0.75,
              child: Card(
                shape: rShapeBorder(16),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign In',
                        style: titleTexts(Colors.grey.shade800, FontWeight.bold, 32)),
                    Container(
                      child: RaisedButton(
                        color: Colors.blue,
                        textTheme: ButtonTextTheme.primary,
                        shape: rShapeBorder(32),
                        child: switcher,
                        onPressed: (){
                          signInWithGoogle();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      )),
    );
  }
}
