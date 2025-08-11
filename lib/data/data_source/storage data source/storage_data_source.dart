import 'package:image_picker/image_picker.dart';

abstract class StorageDataSource {
  Future<String> addUserImage(XFile image);
}
