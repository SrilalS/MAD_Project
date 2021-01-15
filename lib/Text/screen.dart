import 'package:mad_project/config/palette.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  final String clubName;
  final String postId;
  final String clubImage;
  final String clubName;
  final String caption;
  final String imageUrl;
  const ClubPage({Key key, this.clubName}) : super(key: key);
  @override
  _ClubPageState createState() => _ClubPageState(clubName);
}

class _ClubPageState extends State<ClubPage> {
  final String clubName;

  _ClubPageState(this.clubName);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.backpack,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            clubName,
            style: const TextStyle(

              color: Colors.black,

              // color:Palette.nsbmgreen,

              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),

        ),
        body: Column(
          children: [
            ClubHeader(
              clubName: 'Dancing clubs',
            ),
            Expanded(
              flex: 1,
              child: StreamBuilder<List<Post>>(
                // stream: DatabaseService().getPostfromclubName(clubName),

                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ClubPostContainer(
                          header:snapshot.data[index].header,
                          caption: snapshot.data[index].caption,
                          imageUrl: snapshot.data[index].imageUrl,
                          clubImage: snapshot.data[index].clubImage,
                          clubName: snapshot.data[index].clubName,

                        );
                      }
                  );
                },
              ),
            )
          ],
        ));
  }
}

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;


    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
            .child("postImage/image1" + DateTime.now().toString())
            .putFile(file) ;
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

    print(imageUrl);}