import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminUI extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const AdminUI({Key key, this.clubDoc}) : super(key: key);
  @override
  _AdminUIState createState() => _AdminUIState();
}

class _AdminUIState extends State<AdminUI> {
  File logo;
  final logopicker = ImagePicker();

  File cover;
  final coverpicker = ImagePicker();

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  Future getLogo() async {
    final pickedFile = await logopicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        logo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future coverPhoto() async {
    final pickedFile = await logopicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        cover = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  Future uploadLogo() async {
    try {
      await fstorage.FirebaseStorage.instance
          .ref('clubRes/Logo_'+ widget.clubDoc.id +'.png')
          .putFile(logo);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Club/Society Name',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                minLines: 6,
                maxLines: 8,
                decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 128,
                        child: RaisedButton(
                          elevation: 4,
                          onPressed: (){
                            getLogo();
                          },
                          child: Text('Select Logo'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 128,
                            width: 128,
                            child: logo == null ? Text('Select the Club Logo') : Image.file(
                              logo , fit: BoxFit.fitHeight,),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 128,
                        child: RaisedButton(
                          elevation: 4,
                          onPressed: (){
                            coverPhoto();
                          },
                          child: Text('Select Cover Image'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 128,
                            width: 128,
                            child: cover == null ? Text('Select the Club Cover') : Image.file(cover,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 8),
              Container(
                width: Get.width,
                child: RaisedButton(
                  onPressed: (){
                    uploadLogo();
                  },
                  color: Colors.blue,
                  child: Text('Save', style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
