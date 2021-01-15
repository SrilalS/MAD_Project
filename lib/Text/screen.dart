import 'package:mad_project/config/palette.dart';

import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  final String clubName;

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
                Icons.arrow_back_ios,
                color: Palette.facebookBlue,
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

              color:Palette.nsbmgreen,

              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),

        ),
        body: Column(
          children: [
            ClubHeader(
              clubName: clubName,
            ),
            Expanded(
              flex: 1,
              child: StreamBuilder<List<Post>>(
                stream: DatabaseService().getPostfromclubName(clubName),

                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ClubPostContainer(
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
