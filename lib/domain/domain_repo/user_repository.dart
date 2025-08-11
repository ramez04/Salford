import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/entities/auth_entity.dart';
import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> addUser(AuthEntity auth);
  Future<Either<Failure, UserEntity>> updateUser(UserEntity user);
  Future<Either<Failure, UserEntity>> getUser(AuthEntity  auth);
  Future<Either<Failure, UserEntity>> getUserWithId(String  id);
}
