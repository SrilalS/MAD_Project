import 'package:flutter/material.dart';

import 'package:mad_project/services/database_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';

import 'package:mad_project/widgets/widgets.dart';
import 'package:mad_project/models/models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,

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

      ),

      body: StreamBuilder<List<Post>>(
        stream: DatabaseService().getPostfromPostCollection(),
        builder: (context,snapshot){
          return ListView.builder(
            itemCount: snapshot.data.length,
              itemBuilder: (context,index){
              return PostContainer(
                captiion: snapshot.data[index].caption,
                imageUrl: snapshot.data[index].imageUrl,
                clubImage: snapshot.data[index].clubImage,
                clubName: snapshot.data[index].clubName,
              );
              }
          );
        },
      )
//        SliverToBoxAdapter(
//          child:CreatePostContainer(currentUser:currentUser),
//        ),
//



    );
  }
}