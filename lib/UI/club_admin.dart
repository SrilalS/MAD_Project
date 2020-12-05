import 'package:cplustraining/widgets/admin_post.dart';
import 'package:flutter/material.dart';
import 'package:cplustraining/config/palette.dart';
import 'package:cplustraining/data/data.dart';

import 'package:cplustraining/widgets/widgets.dart';
import 'package:cplustraining/models/models.dart';

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
