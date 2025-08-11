import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/domain_repo/user_repository.dart';
import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class GetUserUsingId {
  final UserRepository repository;

  GetUserUsingId({required this.repository});
  Future<Either<Failure, UserEntity>> call(String id ) async {
    var result = await repository.getUserWithId(id);
    return result;
  }
}
