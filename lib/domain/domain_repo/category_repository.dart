import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/entities/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCatigories();
}
