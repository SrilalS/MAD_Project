import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:mad_project/models/models.dart';

import 'package:mad_project/models/models.dart';

import 'package:mad_project/models/post_model.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

//   FirebaseFirestore reference = FirebaseFirestore.instance;
  AuthUser _userFromFirebaseUser(User user){
    return user != null ? AuthUser(uid: user.uid): null;
  }

  Future signInAnon() async{

    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future<void> setPost(String caption, String imageUrl, String clubId,
      String postId, String clubImage, String clubName, DateTime date) {
    return _db.collection('Posts').doc(postId).set({
      "caption": caption,
      "imageUrl": imageUrl,
      "clubId": clubId,
      "postId": postId,
      "clubImage": clubImage,
      "clubName": clubName,
      "date": date,
    });
  }

  Future<void> setEvent(String caption, String imageUrl, String clubId,
      String postId, String clubImage, String clubName, DateTime date) {
    return _db.collection('Events').doc(postId).set({
      "caption": caption,
      "imageUrl": imageUrl,
      "clubId": clubId,
      "postId": postId,
      "clubImage": clubImage,
      "clubName": clubName,
      "date": date,
    });
  }

  Future<void> deletePost(String postId) {
    return _db.collection('Posts').doc(postId).delete();
  }

  Future<void> deleteEvent(String postId) {
    return _db.collection('Events').doc(postId).delete();

  Future<void> setPost(
          String caption,
      String imageUrl,
      String clubId,
      String postId,
      String clubImage,
      String clubName,
      DateTime date
      ){

    return _db.collection('Posts').doc(postId).set({
    "caption":caption,
      "imageUrl":imageUrl,
      "clubId":clubId,
      "postId":postId,
      "clubImage":clubImage,
      "clubName":clubName,
      "date":date,
    }

    );
  }
  Future<void> setEvent(
      String caption,
      String imageUrl,
      String clubId,
      String postId,
      String clubImage,
      String clubName,
      DateTime date
      ){

    return _db.collection('Events').doc(postId).set({
      "caption":caption,
      "imageUrl":imageUrl,
      "clubId":clubId,
      "postId":postId,
      "clubImage":clubImage,
      "clubName":clubName,
      "date":date,
    }

    );
  }
  Future<void> deletePost(String postId){
    return _db.collection('Posts').doc(postId).delete();
  }
  Future<void> deleteEvent(String postId){
    return _db.collection('Events').doc(postId).delete();

    FirebaseFirestore reference = FirebaseFirestore.instance;

  Future<void> setPost(Post post) {
    var options = SetOptions(merge: true);
    return _db.collection('Posts').doc(post.caption).set(post.toMap(), options);
  }

  Future<void> deletePost(String postId) {
    return _db.collection('post').doc(postId).delete();
  }

  Stream<List<Post>> getPostfromPostCollection() {
    return _db.collection('Posts').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  Stream<List<Post>> getPostfromclubName(String clubName) {
    return _db.collection('Posts').where('clubName',isEqualTo: clubName).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }
  Stream<List<Post>> getEventfromclubName(String clubName) {
    return _db.collection('Events').where('clubName',isEqualTo: clubName).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }



}




  Stream<List<Post>> getPostfromclubName(String clubName) {
    return _db
        .collection('Posts')
        .where('clubName', isEqualTo: clubName)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  Stream<List<Post>> getEventfromclubName(String clubName) {
    return _db

        .collection('Events')

        .collection('Posts')

        .where('clubName', isEqualTo: clubName)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }
}

