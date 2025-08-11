import 'package:clean_archi/core/error/connection_failure.dart';
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/core/error/unexpected_failure.dart';
import 'package:clean_archi/data/data_source/user%20data%20source/user_data_source.dart';
import 'package:clean_archi/data/model/user_model.dart';
import 'package:clean_archi/domain/domain_repo/user_repository.dart';
import 'package:clean_archi/domain/entities/auth_entity.dart';
import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, UserEntity>> addUser(AuthEntity auth) async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {

        UserModel user = await dataSource.addUser(auth);

        return Right(user.toEntity());
      } catch (e) {
        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(AuthEntity auth) async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {
        UserModel user = await dataSource.getUser(auth);
        return Right(user.toEntity());
      } catch (e) {

        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(UserEntity user) async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {
        UserModel userRes = await dataSource.updateUser(user);
        return Right(userRes.toEntity());
      } catch (e) {
        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserWithId(String id) async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {
        UserModel userRes = await dataSource.getUserWithId(id);

        return Right(userRes.toEntity());
      } catch (e) {
        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
