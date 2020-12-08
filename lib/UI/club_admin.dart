import 'package:mad_project/UI/club_screen.dart';
import 'package:mad_project/services/database_service.dart';
import 'package:mad_project/widgets/admin_post.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';
import 'package:mad_project/widgets/club_header.dart';
import 'package:mad_project/widgets/club_post_container.dart';

import 'package:mad_project/widgets/widgets.dart';
import 'package:mad_project/models/models.dart';

class AdminPage extends StatefulWidget {
  final String clubName;

  const AdminPage({Key key, this.clubName}) : super(key: key);
  @override
  _AdminPageState createState() => _AdminPageState(clubName);
}

class _AdminPageState extends State<AdminPage> {
  final String clubName;

  _AdminPageState(this.clubName);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,

        title: Text(
          'Admin',
          style: const TextStyle(
            color:Palette.nsbmgreen,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
        centerTitle: false,

        actions: [
          IconButton(icon:Icon(Icons.send) ,
              color: Colors.purple,
              onPressed: (){
                print("send notification");
              }),
        ],

      ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
                child: StreamBuilder<List<Post>>(
                  stream: DatabaseService().getPostfromclubName(clubName),
                  builder: (context,snapshot){
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return AdminPost(
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
        )

    );



//            SliverToBoxAdapter(
//              child:CreatePostContainer(currentUser:currentUser),
//            ),

//            SliverList(
//              delegate: SliverChildBuilderDelegate((context, index){
//                final Post post = posts[index];
//                return AdminPost(post:post);
//              },
//                childCount: posts.length,
//              ),
//            )


  }
}
