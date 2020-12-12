import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SendNotifi extends StatefulWidget {
  @override
  _SendNotifiState createState() => _SendNotifiState();
}

class _SendNotifiState extends State<SendNotifi> {

  void sendNotification(String title, String content) async{
    var dataJSON = {
      "app_id": "36ac3004-610a-4d04-9f6a-e65ba0e7c5f5",
      "included_segments": ["All"],
      "data": {"foo": "bar"},
      "contents": {"en": content},
      "title": {"en": title}
    };

    Dio dio = new Dio();
    //dio.options.baseUrl = 'https://onesignal.com/api/v1/notifications';
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Basic YjYwNWFhNGMtNGQxMi00YjNiLWJhNWUtMzE4NWI5ZjcyY2Q3";
    await dio.post('https://onesignal.com/api/v1/notifications', data: jsonEncode(dataJSON));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: (){
                  sendNotification('title', 'content');
              },
            )
          ],
        ),
      ),
    );
  }
}
