import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Editprofile extends StatefulWidget {
  final String name;
  final String email;
  final String faculty;
  final String clublist;
  final String imageUrl;

  const Editprofile(
      {Key key,
      this.name,
      this.email,
      this.faculty,
      this.clublist,
      this.imageUrl})
      : super(key: key);
  @override
  _EditprofileState createState() =>
      _EditprofileState(name, email, faculty, clublist, imageUrl);
}

class _EditprofileState extends State<Editprofile> {
  String name;
  String email;
  String faculty;
  String clublist;
  String imageUrl;

  _EditprofileState(
      this.name, this.email, this.faculty, this.clublist, this.imageUrl);
  Widget textfield({@required String hintText}) {
    return Material(
      elevation: 30,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold),
          fillColor: Colors.white30,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF00B0FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomPaint(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  painter: HeaderCurvedContainer(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text("Edit Profile",
                                style: TextStyle(
                                    fontSize: 35,
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                          InkWell(
                            onTap: () {
                              print('change image');
                              uploadImage();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height - 430,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              initialValue: name,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                // hintText: hintText,
                                hintStyle: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none),
                              ),
                              // decoration:buildInputDecoration(Icons.phone,"Phone No"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
//                      onSaved: (String value){
//                        phone = value;
//                      },
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // hintText: hintText,
                                hintStyle: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none),
                              ),
                              // decoration:buildInputDecoration(Icons.phone,"Phone No"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
//                      onSaved: (String value){
//                        phone = value;
//                      },
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: clublist,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                // hintText: hintText,
                                hintStyle: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none),
                              ),
                              // decoration:buildInputDecoration(Icons.phone,"Phone No"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter club';
                                }
                                return null;
                              },
//                      onSaved: (String value){
//                        phone = value;
//                      },
                              onChanged: (val) {
                                setState(() {
                                  clublist = val;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: faculty,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                // hintText: hintText,
                                hintStyle: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none),
                              ),
                              // decoration:buildInputDecoration(Icons.phone,"Phone No"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter Faculty';
                                }
                                return null;
                              },
//                      onSaved: (String value){
//                        phone = value;
//                      },
                              onChanged: (val) {
                                setState(() {
                                  faculty = val;
                                });
                              },
                            ),
                            // textfield(
                            //   hintText: "Email",
                            // ),
                            // textfield(
                            //   hintText: "Faculty",
                            // ),
                            // textfield(
                            //   hintText: "Registerd Clubs",
                            // ),
                            Container(
                              height: 35,
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // CustomPaint(
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: MediaQuery.of(context).size.height,
                //   ),
                //   painter: HeaderCurvedContainer(),
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.all(0),
                //       child: Text("Edit Profile",
                //           style: TextStyle(
                //               fontSize: 35,
                //               letterSpacing: 1.5,
                //               color: Colors.white,
                //               fontWeight: FontWeight.w600)),
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(10.0),
                //       width: MediaQuery.of(context).size.width / 2,
                //       height: MediaQuery.of(context).size.height - 430,
                //       decoration: BoxDecoration(
                //         border: Border.all(color: Colors.white, width: 5),
                //         shape: BoxShape.circle,
                //         color: Colors.white,
                //         image: DecorationImage(
                //             image: NetworkImage(''), fit: BoxFit.fill),
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 200, left: 184),
                //   child: CircleAvatar(
                //     backgroundColor: Colors.black54,
                //     child: IconButton(
                //       icon: Icon(
                //         Icons.edit,
                //         color: Colors.white,
                //       ),
                //       onPressed: () {},
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage
            .ref()
            .child("user/image" + DateTime.now().toString())
            .putFile(file);
        // .onComplete;

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }

    print(imageUrl);
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFF00B0FF);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 190, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
