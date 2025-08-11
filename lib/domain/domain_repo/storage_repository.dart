import 'package:clean_archi/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class StorageReposetory {
  Future<Either<Failure, String>> addUserImage(XFile image);
}
