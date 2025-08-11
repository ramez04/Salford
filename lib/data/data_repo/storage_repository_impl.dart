
import 'package:clean_archi/core/error/connection_failure.dart';
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/core/error/unexpected_failure.dart';
import 'package:clean_archi/data/data_source/storage%20data%20source/storage_data_source.dart';
import 'package:clean_archi/domain/domain_repo/storage_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class StorageReposetoryImpl implements StorageReposetory {
  final StorageDataSource storageDataSource;

  StorageReposetoryImpl({required this.storageDataSource});
  @override
  Future<Either<Failure, String>> addUserImage(XFile image) async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {
        String res = await storageDataSource.addUserImage(image);
        return Right(res);
      } catch (e) {
        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}