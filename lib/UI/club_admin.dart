import 'package:mad_project/widgets/admin_post.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';

import 'package:mad_project/widgets/widgets.dart';
import 'package:mad_project/models/models.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
          slivers:[
            SliverAppBar(
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
              floating: true,
              actions: [
                IconButton(icon:Icon(Icons.send) ,
                    color: Colors.purple,
                    onPressed: (){
                  print("send notification");
                    }),
              ],

            ),
//            SliverToBoxAdapter(
//              child:CreatePostContainer(currentUser:currentUser),
//            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                final Post post = posts[index];
                return AdminPost(post:post);
              },
                childCount: posts.length,
              ),
            )
          ]
      ),
    );
  }
}
