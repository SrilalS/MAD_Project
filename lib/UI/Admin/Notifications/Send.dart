import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SendNotifi extends StatefulWidget {
  @override
  _SendNotifiState createState() => _SendNotifiState();
}

class _SendNotifiState extends State<SendNotifi> {

  void sendNotification(String title, String content){
    Dio dio = new Dio();
    dio.options.baseUrl = 'https://onesignal.com/api/v1/notifications';
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Basic YjYwNWFhNGMtNGQxMi00YjNiLWJhNWUtMzE4NWI5ZjcyY2Q3";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
