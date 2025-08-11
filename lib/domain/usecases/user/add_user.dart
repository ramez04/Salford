
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/domain_repo/user_repository.dart';
import 'package:clean_archi/domain/entities/auth_entity.dart';
import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class AddUser {
  final UserRepository repository;

  AddUser({required this.repository});
  Future<Either<Failure, UserEntity>> call(AuthEntity auth) async {
    var result = await repository.addUser(auth);
    return result;
  }
}
