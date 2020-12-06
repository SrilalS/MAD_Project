import 'package:mad_project/models/models.dart';
import 'package:meta/meta.dart';


class Post {
  final User user;
   String caption;
   String timeAgo;
   String imageUrl;
  final int likes;
  final int comments;
  final int shares;

 Post({
    @required this.user,
    @required this.caption,
    @required this.timeAgo,
    @required this.imageUrl,
    @required this.likes,
    @required this.comments,
    @required this.shares,
  });

  static fromJson(Map<String, dynamic> json) {
    return Post(
        user: json['user'],
        caption: json['caption'],
        timeAgo: json['timeAgo'],
        imageUrl: json['imageUrl'],
        likes: json['likes'],
        comments: json['comments'],
        shares: json['shares']);
  }
  Map<String, dynamic > toMap(){
    return{
      'user':user,
      'caption':caption,
      'timeAgo':timeAgo,
      'imageUrl':imageUrl,
      'likes':likes,
      'comments':comments,
      'shares':shares
    };
  }
}