

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
  final photopicker = ImagePicker();
  String type = 'Event';
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  File photo;

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Wrap(
              spacing: 20, // to apply margin in the main axis of the wrap
              runSpacing: 20, // to apply margin in the cross axis of the wrap
              children: [
                Text('New Event/Post' ,style: TextStyle(fontSize: 21),),
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
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder()),
                ),
                TextFormField(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
