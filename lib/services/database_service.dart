import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project/models/post_model.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
//   FirebaseFirestore reference = FirebaseFirestore.instance;

  Stream<List<Post>> getPost() {
    return _db.collection('clubCats').doc('tj1oBjFYatSBXnzUaKeI').collection('ClubList').doc().collection('Post').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }
  Future<void> setPost(Post post){
    var options = SetOptions(merge: true);
    return _db.collection('post').doc(post.caption).set(post.toMap(),options);
  }
  Future<void> deletePost(String postId){
    return _db.collection('post').doc(postId).delete();
  }
  Stream<List<Post>> get transports{
    return _db.collection('clubCats').doc().collection('ClubList').doc().collection('Post').snapshots().map(_transportListFromSnapshots);

  }
  Stream<List<Post>> getPostfromPostCollection() {
    return _db.collection('Posts').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }
  Stream<List<Post>> getPostfromclubName(String clubName) {
    return _db.collection('Posts').where('clubName',isEqualTo: clubName).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  List<Post> _transportListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Post(
        caption: doc.data()["caption"] ?? '',
        imageUrl: doc.data()["imageUrl"] ??'',
      );

    }).toList();


  }

}

