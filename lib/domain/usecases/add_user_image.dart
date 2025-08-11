
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/domain_repo/storage_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class AddUserImage {
  final StorageReposetory storageReposetory;

  AddUserImage({required this.storageReposetory});

  Future<Either<Failure, String>> call(XFile image) {
    var result = storageReposetory.addUserImage(image);
    return result;
  }
}
