import 'package:mad_project/models/models.dart';
import 'package:meta/meta.dart';

//
//class Post {
////  final User user;
//   final String caption;
////   String timeAgo;
//   final String imageUrl;
////  final int likes;
////  final int comments;
//////  final int shares;
////  Post({this.imageUrl, this.caption});
// Post({
////    @required this.user,
//    @required this.caption,
////    @required this.timeAgo,
//    @required this.imageUrl,
////    @required this.likes,
////    @required this.comments,
////    @required this.shares,
//  });
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//    return Post(
////        user: json['user'],
//        caption: json['caption'] ?? '',
////        timeAgo: json['timeAgo'],
//        imageUrl: json['imageUrl'] ?? '',
//    );
////        likes: json['likes'],
////        comments: json['comments'],
////        shares: json['shares']);
//  }
//  Map<String, dynamic > toMap(){
//    return{
////      'user':user,
//      'caption':caption,
////      'timeAgo':timeAgo,
//      'imageUrl':imageUrl,
////      'likes':likes,
////      'comments':comments,
////      'shares':shares
//    };
//  }
//}
class Post{
  final String caption;
  final String clubId;
  final String clubImage;
  final String clubName;
//  final DateTime date;
  final String imageUrl;
  final String postId;

  Post(
      {this.caption,
      this.clubId,
      this.clubImage,
      this.clubName,
//      this.date,
      this.imageUrl,
      this.postId});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

      caption: json['caption'] ?? '',
      clubId: json['clubId'] ?? '',
      clubImage: json['clubImage'] ?? '',
      clubName: json['clubName'] ?? '',
//      date: json['date'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      postId: json['postId'] ?? '',

    );

  }
  Map<String, dynamic > toMap(){
    return{

      'caption':caption,
      'clubId':clubId,
      'clubImage':clubImage,
      'clubName':clubName,
//
      'imageUrl':imageUrl,
      'postId':postId,

    };
  }
}