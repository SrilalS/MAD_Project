import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:mad_project/data/data.dart';
//import 'package:mad_project/models/models.dart';
import 'package:mad_project/widgets/profile_avatar.dart';

class ClubPostContainer extends StatelessWidget {
  final String caption;
  final String imageUrl;
  final String clubImage;
  final String clubName;

  const ClubPostContainer(
      {Key key, this.caption, this.imageUrl, this.clubImage, this.clubName})
      : super(key: key);

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
                  _postHeader(
                    clubImage: clubImage,
                    clubName: clubName,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(caption),
                  imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6.0,
                        )
                ],
              ),
            ),
            imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.network(imageUrl),
                    // CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: ClubHeader(),
            )
          ],
        ));
  }
}

class _postHeader extends StatelessWidget {
  final String clubImage;
  final String clubName;

  const _postHeader({Key key, this.clubImage, this.clubName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfileAvatar(imageUrl: clubImage),
        const SizedBox(width: 8.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              clubName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              children: <Widget>[
//                Text('${post.timeAgo} .',
//                style:  TextStyle(color: Colors.grey[600],
//                fontSize: 12.0
//                ),
//                ),
                Icon(Icons.public, color: Colors.grey[600], size: 12.0)
              ],
            )
          ],
        )),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        )
      ],
    );
  }
}

// class _postStats extends StatelessWidget {
//   final Post post;

//   const _postStats({Key key,@required this.post}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//           Row(
//       children: <Widget>[
//         Container(
//           width: 100,
//           height: 25,

//           padding: const EdgeInsets.all(4.0),
//           // decoration: BoxDecoration(
//           //   color: Palette.facebookBlue,
//           //   // shape: BoxShape.circle,
//           // ),

//           child: RaisedButton(
//            color: Colors.blue[400],
//             onPressed: () {
//                Navigator.push(context,
//             MaterialPageRoute(
//         builder:(context) => ClubPage()
//          ),);

//             },
//             child: const Text('View Club',
//             style: TextStyle(fontSize: 11 , color: Colors.white)),
//           ),
//           //  const Icon(
//           //   Icons.thumb_up,
//           //   size: 10.0,
//           //   color: Colors.white,
//           // ),
//         ),
//         const SizedBox(width: 4.0,),

//         // Text(
//         //   '${post.comments} Comments', style: TextStyle(
//         //     color: Colors.grey[600],
//         //   ),
//         // ),
//         // const SizedBox(width:8.0),
//         // Text(
//         //   '${post.shares} Shares', style: TextStyle(
//         //     color: Colors.grey[600],
//         //   ),
//         // )
//       ],
//     ),
//     const Divider(),
//     Row(
//       children: <Widget>[
//         // _PostButton(
//         //   icon: Icon(
//         //     MdiIcons.thumbUpOutline,
//         //     color: Colors.grey[600],
//         //     size: 20.0,
//         //   ),
//         //   label : 'Like',
//         //   onTap: () => print('Like'),
//         // )
//       ],
//     )
//       ],
//     );

//   }
// }// TODO Implement this library.
