
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/domain_repo/category_repository.dart';
import 'package:clean_archi/domain/entities/category_model.dart';
import 'package:dartz/dartz.dart';

class GetCategories {
  final CategoryRepository repository;
  GetCategories({required this.repository});
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    var result = await repository.getCatigories();
    return result;
  }
}

