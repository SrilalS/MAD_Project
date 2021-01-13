import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/Classes/StorageController.dart';
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
    await dio.post('https://onesignal.com/api/v1/notifications', data: jsonEncode(dataJSON)).then((value){
      if (value.statusCode != 200){
        Get.snackbar(
          'Send Failed!',
          'Send Failed please retry',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          icon: Icon(Icons.error, color: Colors.white,),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          width: Get.width * 0.8,
          //height: Get.height * 0.5,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleC,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    labelText: 'Title',
                    border: outlineIB()
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: contentC,
                maxLines: 12,
                minLines: 2,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    labelText: 'Messege',
                    border: outlineIB()
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: Get.width,
                height: 48,
                child: RaisedButton(
                  shape: rShapeBorder(4),
                  child: Text('Send'),
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: (){
                    if (titleC.text.isEmpty || contentC.text.isEmpty){
                      Get.snackbar(
                        'Empty Details!',
                        'Title or Content Must not be Empty!',
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                        icon: Icon(Icons.error, color: Colors.white,),
                      );
                    } else {
                      sendNotification(titleC.text, contentC.text);
                    }
                  },
                ),
              ),
            ],
          ),
        );
  }
}
