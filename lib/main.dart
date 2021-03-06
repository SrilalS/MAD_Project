import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/Auth.dart';
import 'package:mad_project/UI/Home.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ClubsPlus());
}

class ClubsPlus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    OneSignal.shared.setLogLevel(OSLogLevel.none, OSLogLevel.none);
    OneSignal.shared.init(
        "36ac3004-610a-4d04-9f6a-e65ba0e7c5f5",
    );

    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

    return GetMaterialApp(
      title: 'Clubs Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (FirebaseAuth.instance.currentUser != null) ? Home(): Auth(),
    );
  }
}