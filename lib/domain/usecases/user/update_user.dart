
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/domain_repo/user_repository.dart';
import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser({required this.repository});

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    var result = await repository.updateUser(user);
    return result;
  }
}
