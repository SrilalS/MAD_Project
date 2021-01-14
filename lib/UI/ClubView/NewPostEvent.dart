import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mad_project/Classes/StorageController.dart';

class NewPostEvent extends StatefulWidget {
  final DocumentSnapshot clubDoc;

  const NewPostEvent({Key key, this.clubDoc}) : super(key: key);
  @override
  _NewPostEventState createState() => _NewPostEventState();
}

class _NewPostEventState extends State<NewPostEvent> {
  final StorageController storageController = new StorageController();
  FirebaseFirestore fbase = FirebaseFirestore.instance;
  final photopicker = ImagePicker();

  File photo;
  String photoURL;

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController link = TextEditingController();
  String type = 'Event';
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();

  Future getPhoto() async {
    final pickedFile = await photopicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  showTPicker() async{
    await showTimePicker(
        context: context,
        initialTime: time
    ).then((value){
      if (value != null){
        setState(() {
          time = value;
        });
      }
    });
  }

  showDPicker() async{
    await showDatePicker(
        context: context,
      initialDate: date,
        lastDate: DateTime.utc(DateTime.now().year+1),
        firstDate: DateTime.now()
    ).then((value){
      if (value != null){
        setState(() {
          date = value;
        });
      }
    });
  }

  Widget switcher = Text(
    'Save',
    style: TextStyle(color: Colors.white),
  );

  Future uploadImage() async {
    setState(() {
      switcher = Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),);
    });
    try {
      await storageController.uploadPost('Photo_'+ DateTime.now().millisecondsSinceEpoch.toString(), photo).then((value){
        photoURL = value;
      }).then((value) => addEvent());
    } catch (e) {
      print(e);
    }
  }

  void addEvent() async{
    await fbase.collection('HomeFeed').add({
      'TIME': DateTime.now().millisecondsSinceEpoch,
      'ClubID': widget.clubDoc.id,
      'Title': title.text,
      'Description': desc.text,
      'Type': type,
      'Photo': photoURL,
      'Date': date.year.toString() +'-'+ date.month.toString() +'-'+ date.day.toString()+' '+time.hour.toString()+':'+time.minute.toString(),
    }).then((value){
      Get.back();
      Get.snackbar(
          'Success!',
          'Post Saved!',
          icon: Icon(Icons.cloud_done, color: Colors.white),
          backgroundColor: Colors.green,
          colorText: Colors.white);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'NEP',
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Event/Post'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Wrap(
                spacing: 20, // to apply margin in the main axis of the wrap
                runSpacing: 20, // to apply margin in the cross axis of the wrap
                children: [
                  Row(
                    children: [
                      Text('Type: '),
                      Radio(
                        value: 'Event',
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                      ),
                      Text('Event '),

                      Radio(
                        value: 'Post',
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                      ),
                      Text('Post '),
                    ],
                  ),

                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: desc,
                    minLines: 3,
                    maxLines: 4,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder()),
                  ),

                  Column(
                    children: [
                      Container(
                        width: 128,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          elevation: 4,
                          onPressed: () {
                            getPhoto();
                          },
                          child: Text('Select Photo'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 128,
                            width: 128,
                            child: photo == null
                                ? Text('Select Post/Event Photo')
                                : Image.file(
                              photo,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),


                  Visibility(
                    visible: type == 'Event',
                    child: TextFormField(
                      controller: link,
                      decoration: InputDecoration(
                          labelText: 'Link (if any)',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Visibility(
                    visible: type == 'Event',
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: Colors.blue,
                      child: Text(
                        'Time: '+time.hour.toString()+ ':'+ time.minute.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        showTPicker();
                      },
                    ),
                  ),
                  Visibility(
                    visible: type == 'Event',
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: Colors.blue,
                      child: Text(
                        'Date: '+date.year.toString()+'-'+ date.month.toString()+'-'+ date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        showDPicker();
                      },
                    ),
                  ),
                  Container(
                    height: 48,
                    width: Get.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: Colors.blue,
                      child: switcher,
                      onPressed: (){
                        uploadImage();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
