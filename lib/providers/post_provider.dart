import 'package:flutter/cupertino.dart';
import 'package:mad_project/models/models.dart';
import 'package:mad_project/services/database_service.dart';

class PostProvider with ChangeNotifier{
  final firestoreService = DatabaseService();
   User _user;
  String _caption;
  String _timeAgo;
  String _imageUrl;
   int _likes;
   int _comments;
   int _shares;

  User get user => _user;

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  String get caption => _caption;

  set caption(String value) {
    _caption = value;
    notifyListeners();
  }

  String get timeAgo => _timeAgo;

  set timeAgo(String value) {
    _timeAgo = value;
    notifyListeners();
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
    notifyListeners();

  }

  int get likes => _likes;

  set likes(int value) {
    _likes = value;
    notifyListeners();
  }

  int get comments => _comments;

  set comments(int value) {
    _comments = value;
    notifyListeners();
  }

  int get shares => _shares;

  set shares(int value) {
    _shares = value;
    notifyListeners();
  }
  final Stream<List<Post>> post = DatabaseService().getPost();
}