import 'package:cached_network_image/cached_network_image.dart';
import 'package:mad_project/UI/club_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mad_project/config/palette.dart';
import 'package:mad_project/data/data.dart';
import 'package:mad_project/models/models.dart';
import 'package:mad_project/widgets/profile_avatar.dart';

class PostContainer extends StatelessWidget {
//  final Post post;
  final String captiion;
  final String imageUrl;
  final String clubImage;
  final String clubName;
  static final DateTime now = DateTime.now();
  const PostContainer({Key key, this.captiion, this.imageUrl, this.clubImage, this.clubName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _postHeader( clubName: clubName,clubImage: clubImage,),
          const SizedBox(height: 4.0,),
          Text(captiion),
          imageUrl != null ? const SizedBox.shrink() : const SizedBox(height: 6.0,)

        ],
      ),
        ),
        imageUrl != null ?
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.network(imageUrl),
          // CachedNetworkImage(imageUrl: post.imageUrl),
          )
       
        : const SizedBox.shrink(),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: _postStats(clubName: clubName,),
        )
        ],
      ) 
       
      
    );
  }
}

class _postHeader  extends StatelessWidget {
  final String clubImage;
  final String clubName;

  const _postHeader({Key key, this.clubImage, this.clubName}) : super(key: key);
//  final Post post;
//  final String captiion;
//  final String imageUrl;
//
//  const _postHeader({Key key, this.captiion, this.imageUrl}) : super(key: key);
 // const _postHeader({Key key,@required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfileAvatar(imageUrl: clubImage),
        const SizedBox(width:8.0),
        Expanded(
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(clubName,
            style: const TextStyle(
              fontWeight: FontWeight.w600
            ),
            ),
            Row(
              children: <Widget>[
//                Text('${post.timeAgo} .',
//                style:  TextStyle(color: Colors.grey[600],
//                fontSize: 12.0
//                ),
//                ),
                Icon(Icons.public,
                color: Colors.grey[600],
                size: 12.0
                )
              ],
            )
          ],
        )
          ),
        // IconButton(icon: const Icon(Icons.more_horiz),
        //  onPressed: () => print('More'),
        //  )
      ],
    );
  }
}

class _postStats extends StatelessWidget {

  final String clubName;

  const _postStats({Key key, this.clubName}) : super(key: key);
//  final String imageUrl;
//
//  const _postStats({Key key, this.captiion, this.imageUrl}) : super(key: key);
 // const _postStats({Key key,@required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 25,
          
          padding: const EdgeInsets.all(4.0),
          // decoration: BoxDecoration(
          //   color: Palette.facebookBlue,
          //   // shape: BoxShape.circle,
          // ),
          
          child: RaisedButton(
           color: Colors.blue[400],
            onPressed: () {
               Navigator.push(context,
            MaterialPageRoute(
        builder:(context) => ClubPage(clubName: clubName,)
         ),);
             
            },
            child: const Text('View Club', 
            style: TextStyle(fontSize: 11 , color: Colors.white)),
          ),
          //  const Icon(
          //   Icons.thumb_up,
          //   size: 10.0,
          //   color: Colors.white,
          // ),
        ),
        const SizedBox(width: 4.0,),
       
        
        // Text(
        //   '${post.comments} Comments', style: TextStyle(
        //     color: Colors.grey[600],
        //   ),
        // ),
        // const SizedBox(width:8.0),
        // Text(
        //   '${post.shares} Shares', style: TextStyle(
        //     color: Colors.grey[600],
        //   ),
        // )
      ],
    ),
    const Divider(),
    // Row(
    //   children: <Widget>[
    //     // _PostButton(
    //     //   icon: Icon(
    //     //     MdiIcons.thumbUpOutline,
    //     //     color: Colors.grey[600],
    //     //     size: 20.0,
    //     //   ),
    //     //   label : 'Like',
    //     //   onTap: () => print('Like'),
    //     // )
    //   ],
    // )
      ],
    );
    
  }
}