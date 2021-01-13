import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mad_project/Classes/StorageController.dart';
import 'package:mad_project/Styles/TextStyles.dart';
import 'package:mad_project/UI/Admin/Notifications/Send.dart';
import 'package:mad_project/UI/ClubView/NewPostEvent.dart';

class AdminUI extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const AdminUI({Key key, this.clubDoc}) : super(key: key);

  @override
  _AdminUIState createState() => _AdminUIState();
}

class _AdminUIState extends State<AdminUI> {
  final StorageController storageController = new StorageController();
  File logo;
  final logopicker = ImagePicker();
  bool editMode = false;

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

  Widget switcher = Text(
    'Save',
    style: TextStyle(color: Colors.white),
  );

  Future uploadLogo() async {
    setState(() {
      switcher = Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),);
    });
    try {
      await storageController.upload('Logo_'+ widget.clubDoc.id, logo).then((value){
        logoURL = value;
      }).then((value) => uploadCover());
    } catch (e) {
      print(e);
    }
  }

  Future uploadCover() async {
    try {
        await storageController.upload('Cover_'+ widget.clubDoc.id, logo).then((value){
          coverURL = value;
        }).then((value) => saveClub());
    } catch (e) {
      print(e);
    }
  }

  String logoURL = '';
  String coverURL = '';

  void saveClub() {
    fbase.collection('Clubs').doc(widget.clubDoc.id).set({
      'Name': name.text,
      'Description': desc.text,
      'Category': '',
      'Logo': logoURL,
      'CoverPhoto': coverURL,
    }).then((value){
      Get.snackbar(
          'Success!',
          'Settings Saved!',
          icon: Icon(Icons.cloud_done, color: Colors.white),
          backgroundColor: Colors.green,
          colorText: Colors.white);
      setState(() {
        editMode = false;
        switcher = Text(
          'Save',
          style: TextStyle(color: Colors.white),
        );
      });
    });
  }

  toggleVisibility() {
    setState(() {
      editMode = !editMode;
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();

  setTexts() {
    setState(() {
      name.text = widget.clubDoc['Name'];
      desc.text = widget.clubDoc['Description'];
    });
  }

  showNotifications(){
    Get.defaultDialog(
      radius: 8,
      title: 'Send Alert',
      content: SendNotifi(),
    );
  }

  @override
  void initState() {
    setTexts();
    super.initState();
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
            Text(
              'Admin Tools',
              style: h1(24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.to(NewPostEvent(clubDoc: widget.clubDoc));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    toggleVisibility();
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Text('Send Alerts',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    showNotifications();
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Text('Members', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Visibility(
              visible: editMode,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Club/Society Name',
                        border: OutlineInputBorder()),
                    controller: name,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    minLines: 6,
                    maxLines: 8,
                    decoration: InputDecoration(
                        labelText: 'Description', border: OutlineInputBorder()),
                    controller: desc,
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              elevation: 4,
                              onPressed: () {
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
                                child: logo == null
                                    ? Text('Select the Club Logo')
                                    : Image.file(
                                        logo,
                                        fit: BoxFit.fitHeight,
                                      ),
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onPressed: () {
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
                                child: cover == null
                                    ? Text('Select the Club Cover')
                                    : Image.file(
                                        cover,
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
                    height: 48,
                    width: Get.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onPressed: () {
                        uploadLogo();
                      },
                      color: Colors.blue,
                      child: switcher,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
