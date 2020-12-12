import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/Styles/TextStyles.dart';

class SendNotifi extends StatefulWidget {
  @override
  _SendNotifiState createState() => _SendNotifiState();
}

class _SendNotifiState extends State<SendNotifi> {
  TextEditingController titleC = TextEditingController();
  TextEditingController contentC = TextEditingController();

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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Title' , style: titleTexts(Colors.black, FontWeight.normal, 24)),
              TextField(
                controller: titleC,
                style: TextStyle(fontSize: 21),
                decoration: InputDecoration(

                    border: outlineIB()
                ),
              ),
              Text('Content' , style: titleTexts(Colors.black, FontWeight.normal, 24)),
              TextField(
                controller: contentC,
                maxLines: 12,
                minLines: 2,
                style: TextStyle(fontSize: 21),
                decoration: InputDecoration(
                    border: outlineIB()
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: Get.width,
                height: 48,
                child: RaisedButton(
                  shape: rShapeBorder(32),
                  child: Text('Send'),
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: (){
                    sendNotification(titleC.text, contentC.text);
                  },
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
