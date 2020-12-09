import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mad_project/Styles/TextStyles.dart';
import 'package:mad_project/UI/AuthWidgets/MainLogo.dart';

import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  Future<UserCredential> signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //NSBM Sign IN



  void signInWithNSBM() async {
    User user = await FirebaseAuthOAuth().openSignInFlow(
        "microsoft.com",
        ["email openid"],
        {
          'tenant': '9486ac65-39d3-4d25-977c-76d9c31c0046',
        }
        );
  }

  void signOut(){
    //FirebaseAuth.instance.signOut();
    print(FirebaseAuth.instance.currentUser.tenantId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            mainLogo(),
            Text('Sign In',
                style: titleTexts(Colors.grey.shade900, FontWeight.bold, 32)),
            RaisedButton(
              color: Colors.blue,
              textTheme: ButtonTextTheme.primary,
              shape: rShapeBorder(32),
              onPressed: () {
                signOut();
                //signInWithGoogle();
              },
              child: Text('Sign in With Google'),
            ),
            RaisedButton(
              color: Colors.blue,
              textTheme: ButtonTextTheme.primary,
              shape: rShapeBorder(32),
              onPressed: () {
                signInWithNSBM();
              },
              child: Text('Sign in With NSBM (Microsoft)'),
            )
          ],
        ),
      )),
    );
  }
}
