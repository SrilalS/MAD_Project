import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';
import 'package:mad_project/models/models.dart';
import 'package:mad_project/services/database_service.dart';
import 'package:mad_project/widgets/club_header.dart';
import 'package:mad_project/widgets/club_post_container.dart';
// import 'package:mad_project/widgets/create_post_container.dart';
import 'package:mad_project/widgets/post_container.dart';
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
            clubName,
            style: const TextStyle(
              color:Palette.nsbmgreen,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
      ) ,
      
      body:
        //  ClubPage(),
          StreamBuilder<List<Post>>(
            stream: DatabaseService().getPostfromclubName(clubName),
            builder: (context,snapshot){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
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
        



      );

  }
}
