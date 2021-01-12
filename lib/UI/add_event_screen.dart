import 'package:flutter/material.dart';

import 'package:mad_project/services/database_service.dart';
import 'package:mad_project/widgets/admin_post.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';
import 'package:mad_project/widgets/club_header.dart';
import 'package:mad_project/widgets/admin_header.dart';
import 'package:mad_project/widgets/admin_event.dart';

import 'package:mad_project/widgets/widgets.dart';
import 'package:mad_project/models/models.dart';

class AdminEventScreen extends StatefulWidget {
  final String clubName;

  const AdminEventScreen({Key key, this.clubName}) : super(key: key);
  @override
  _AdminEventScreenState createState() => _AdminEventScreenState(clubName);
}

class _AdminEventScreenState extends State<AdminEventScreen> {
  final String clubName;

  _AdminEventScreenState(this.clubName);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,

          title: Text(
            'Admin Event',
            style: const TextStyle(
              color:Palette.nsbmgreen,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,

//          actions: [
//            IconButton(icon:Icon(Icons.send) ,
//                color: Colors.purple,
//                onPressed: (){
//                  print("send notification");
//                }),
//          ],

        ),
        body: Column(
          children: [
            AdminHeader(),
            Expanded(
              flex: 1,
              child: StreamBuilder<List<Post>>(
                stream: DatabaseService().getEventfromclubName("Dancing Club"),
                builder: (context,snapshot){
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return AdminEventContainer(
                          caption: snapshot.data[index].caption,
                          imageUrl: snapshot.data[index].imageUrl,
                          clubImage: snapshot.data[index].clubImage,
                          clubName: snapshot.data[index].clubName,
                          postId: snapshot.data[index].postId,
                        );
                      }
                  );
                },
              ),
            )
          ],
        )

    );






  }
}
