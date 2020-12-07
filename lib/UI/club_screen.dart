import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';
import 'package:mad_project/models/models.dart';
import 'package:mad_project/widgets/club_header.dart';
import 'package:mad_project/widgets/club_post_container.dart';
// import 'package:mad_project/widgets/create_post_container.dart';
import 'package:mad_project/widgets/post_container.dart';
import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
          color: Palette.facebookBlue,
          ), 
          onPressed: (){
            Navigator.of(context).pop();
          }),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Drama Club',
            style: const TextStyle(
              color:Palette.nsbmgreen,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
      ) ,
      
      body: CustomScrollView(
        slivers:[

        SliverToBoxAdapter(
          child:ClubHeader(currentUser:currentUser),
        ),

//      SliverList(
//        delegate: SliverChildBuilderDelegate((context, index){
//          final Post post = posts[index];
//          return ClubPostContainer(post:post);
//          },
//          childCount: posts.length,
//          ),
//        )
        ]
      ),
    );
  }
}