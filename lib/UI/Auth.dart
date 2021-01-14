import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  Future<UserCredential> signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            RaisedButton(
              
            )

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
      ),
    );
  }
}
