import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:firebase_storage/firebase_storage.dart';

class StorageController{
  fStorage.FirebaseStorage storage = fStorage.FirebaseStorage.instance;
  Future<String> upload(String fileName, File file) async{
    final Reference reference = FirebaseStorage.instance.ref().child('clubRes/' + fileName + '.png');
    await reference.putFile(file);
    return await reference.getDownloadURL();
  }

  Future dLoad(){

  }
}
