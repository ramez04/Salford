
import 'dart:io';

import 'package:clean_archi/data/data_source/storage%20data%20source/storage_data_source.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageDataSourceImpl implements StorageDataSource {
  @override
  Future<String> addUserImage(XFile image) async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref("/Users/${image.path}")
        .putFile(File(image.path));
    return taskSnapshot.ref.getDownloadURL();
  }
}
