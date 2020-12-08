import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project/models/post_model.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
//   FirebaseFirestore reference = FirebaseFirestore.instance;


  Future<void> setPost(Post post){
    var options = SetOptions(merge: true);
    return _db.collection('Posts').doc(post.caption).set(post.toMap(),options);
  }
  Future<void> deletePost(String postId){
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

