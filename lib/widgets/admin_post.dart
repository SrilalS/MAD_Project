
import 'package:mad_project/UI/edit_post.dart';
import 'package:mad_project/models/models.dart';
import 'package:mad_project/services/database_service.dart';
import 'package:mad_project/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AdminPost extends StatelessWidget {
  final String caption;
  final String imageUrl;
  final String clubImage;
  final String clubName;
  final String postId;

  const AdminPost({Key key, this.caption, this.imageUrl, this.clubImage, this.clubName, this.postId}) : super(key: key);


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
                  _postHeader(clubName: clubName,clubImage: clubImage,),
                  const SizedBox(height: 4.0,),
                  Text(caption),
             
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
              child: _postStats(
                caption: caption,
                imageUrl: imageUrl,
                clubImage: clubImage,
                clubName: clubName,
                postId: postId,
              ),
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
//                    Text('${post.timeAgo} .',
//                      style:  TextStyle(color: Colors.grey[600],
//                          fontSize: 12.0
//                      ),
//                    ),
                    Icon(Icons.public,
                        color: Colors.grey[600],
                        size: 12.0
                    )
                  ],
                )
              ],
            )
        ),

      ],
    );
  }
}

class _postStats extends StatelessWidget {
  final String caption;
  final String imageUrl;
  final String clubImage;
  final String clubName;
  final String postId;

  const _postStats({Key key, this.caption, this.imageUrl, this.clubImage, this.clubName, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Container(

              width: 50,
              height: 45,

              padding: const EdgeInsets.all(4.0),

              child: RaisedButton(


                color: Colors.white,
                elevation: 0,
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder:(context) => EditPostPage(clubName: clubName,imageUrl: imageUrl,clubImage: clubImage,postId: postId,caption: caption,)
                    ),);


                },
                child:Align(
                  alignment: Alignment.center,
                  child:const Icon(Icons.edit, size: 18,color: Colors.blue,),
                )


//                child: const Text('Edit',
//                 style: TextStyle(fontSize: 11 , color: Colors.white)),
              ),

            ),
            const SizedBox(width: 4.0,),
            Container(

              width: 50,
              height: 45,

              padding: const EdgeInsets.all(4.0),

              child: RaisedButton(


                  color: Colors.white,
                  elevation: 0,
                  onPressed: () {

                    DatabaseService().deletePost(postId);
                    print(postId);
                  },
                  child:Align(
                    alignment: Alignment.center,
                    child:const Icon(MdiIcons.delete, size: 18,color: Colors.red,),
                  )


//                child: const Text('Edit',
//                 style: TextStyle(fontSize: 11 , color: Colors.white)),
              ),

            ),

          ],
        ),
        const Divider(),

      ],
    );

  }
}