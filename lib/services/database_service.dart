import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project/models/post_model.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Post>> getPost() {
    return _db.collection('').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }
  Future<void> setPost(Post post){
    var options = SetOptions(merge: true);
    return _db.collection('post').doc(post.caption).set(post.toMap(),options);
  }
  Future<void> deletePost(String postId){
    return _db.collection('post').doc(postId).delete();
  }
}
