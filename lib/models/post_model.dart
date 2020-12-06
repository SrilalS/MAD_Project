import 'package:mad_project/models/user_model.dart';
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
}
