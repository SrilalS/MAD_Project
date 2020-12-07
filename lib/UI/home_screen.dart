import 'package:flutter/material.dart';
import 'package:mad_project/providers/post_provider.dart';
import 'package:mad_project/services/database_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';

import 'package:mad_project/widgets/widgets.dart';
import 'package:mad_project/models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: CustomScrollView(
        slivers:[
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          
          title: Text(
            'C Plus',
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
//        SliverToBoxAdapter(
//          child:CreatePostContainer(currentUser:currentUser),
//        ),
//
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index){
          final Post post = PostProvider();
          return PostContainer(post:post);       
          },
          childCount: posts.length,
          ),
        )
        ]
      ),
    );
  }
}