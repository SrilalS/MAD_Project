import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mad_project/Classes/GlobleData.dart';
import 'package:mad_project/Styles/TextStyles.dart';
import 'package:mad_project/UI/Auth.dart';
import 'package:mad_project/main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth fauth = FirebaseAuth.instance;
  FirebaseFirestore fstore = FirebaseFirestore.instance;



  String faculty = 'Faculty of Computing';
  String batch = '19.1';
  bool editmode = false;

  getProfile() async{
    await fstore.collection('Users').doc(fauth.currentUser.email).get().then((value){
      if (value.exists){
        setState(() {
          faculty = value['Faculty'];
          batch = value['Batch'];
        });
      } else {
        fstore.collection('Users').doc(fauth.currentUser.email).set({
          'Admin':false,
          'Club':'',
          'Batch':'19.1',
          'Faculty':'Faculty of Computing',
          'Clubs': [],
        });
      }
    });
  }

  QuerySnapshot clubsList;
  bool loaded = false;

  getClubsList(){
    fstore.collection('Clubs').get().then((value){
      setState(() {
        clubsList = value;
        loaded = true;
      });
    });
  }



  saveProfile(){
    fstore.collection('Users').doc(fauth.currentUser.email).update({
      'Batch':batch,
      'Faculty':faculty,
    });
  }

  @override
  void initState() {
    getProfile();
    getClubsList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      height: 128,
                      width: 128,
                      fit: BoxFit.cover,
                      imageUrl: fauth.currentUser.photoURL,
                    ),
                  )
                ],
              ),
              Text(fauth.currentUser.displayName, style: titleTexts(Colors.black, FontWeight.bold, 24),),
              Text(fauth.currentUser.email, style: titleTexts(Colors.black, FontWeight.normal, 24),),

              Text('Batch: ' + batch),
              Text('Faculty: ' + faculty),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: !editmode,
                    child: Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        onPressed: (){
                          setState(() {
                            editmode = !editmode;
                          });
                        },
                        child: Text('Edit Profile', style: TextStyle(color: Colors.white)),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: editmode,
                    child: Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        onPressed: (){
                          saveProfile();
                          setState(() {
                            editmode = !editmode;
                          });
                        },
                        child: Text('Save', style: TextStyle(color: Colors.white)),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    onPressed: () async{
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      Get.offAll(Auth());
                    },
                    child: Text('SignOut', style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                ],
              ),

              
              Visibility(
                visible: editmode,
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Text('Faculty'),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              faculty = value;
                            });
                          },
                          groupValue: faculty,
                          value: 'Faculty of Computing',
                          title: Text('Faculty of Computing'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              faculty = value;
                            });
                          },
                          groupValue: faculty,
                          value: 'Faculty of Engineering',
                          title: Text('Faculty of Engineering'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              faculty = value;
                            });
                          },
                          groupValue: faculty,
                          value: 'Faculty of Business',
                          title: Text('Faculty of Business'),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('Batch'),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '17.1',
                          title: Text('17.1'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '17.2',
                          title: Text('17.2'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '18.1',
                          title: Text('18.1'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '18.2',
                          title: Text('18.2'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '19.1',
                          title: Text('19.1'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '19.2',
                          title: Text('19.2'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '20.1',
                          title: Text('20.1'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '20.2',
                          title: Text('20.2'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '21.1',
                          title: Text('21.1'),
                        ),
                        RadioListTile(
                          onChanged: (value) {
                            setState(() {
                              batch = value;
                            });
                          },
                          groupValue: batch,
                          value: '21.2',
                          title: Text('21.2'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: !editmode,
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    Text('My Clubs'),
                    Container(
                      height: Get.height * 0.5,
                      child: ListView.builder(
                        itemCount: user['Clubs'].length,
                        itemBuilder: (context, index){

                          if (clubsList != null){
                            String name = clubsList.docs.where((element) => element.id == user['Clubs'][index]).first['Name'];
                            return Card(
                              margin: EdgeInsets.all(16),
                              child: ListTile(
                                title: Text(name),
                              ),
                            );
                          } else {
                            return LinearProgressIndicator();
                          }


                        },
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }
}
