import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:firebase_storage/firebase_storage.dart';

class StorageController{
  fStorage.FirebaseStorage storage = fStorage.FirebaseStorage.instance;
  Future<String> upload(String clubID) async{

    final Reference reference = FirebaseStorage.instance.ref().child(clubID + '/Images/file.txt');
    await reference.putString('data');
    return await reference.getDownloadURL();
  }

  Future dLoad(){

  }
}