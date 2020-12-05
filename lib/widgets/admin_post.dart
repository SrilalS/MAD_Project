
import 'package:cplustraining/models/models.dart';
import 'package:cplustraining/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AdminPost extends StatelessWidget {
  final Post post;

  const AdminPost({Key key, this.post}) : super(key: key);
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
                  _postHeader(post: post),
                  const SizedBox(height: 4.0,),
                  Text(post.caption),
                  post.imageUrl != null ? const SizedBox.shrink() : const SizedBox(height: 6.0,)

                ],
              ),
            ),
            post.imageUrl != null ?
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(post.imageUrl),
              // CachedNetworkImage(imageUrl: post.imageUrl),
            )

                : const SizedBox.shrink(),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _postStats(post:post),
            )
          ],
        )


    );
  }
}

class _postHeader  extends StatelessWidget {
  final Post post;

  const _postHeader({Key key,@required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width:8.0),
        Expanded(
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(post.user.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('${post.timeAgo} .',
                      style:  TextStyle(color: Colors.grey[600],
                          fontSize: 12.0
                      ),
                    ),
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
  final Post post;

  const _postStats({Key key,@required this.post}) : super(key: key);
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
                        builder:(context) => null
                    ),);

                },
                child:Align(
                  alignment: Alignment.center,
                  child:const Icon(MdiIcons.commentEdit, size: 18,color: Colors.blue,),
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
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context) => null
                      ),);

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