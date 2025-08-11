
import 'package:clean_archi/core/error/connection_failure.dart';
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/core/error/unexpected_failure.dart';
import 'package:clean_archi/data/data_source/category%20data%20source/category_data_source.dart';
import 'package:clean_archi/data/model/category_model.dart';
import 'package:clean_archi/domain/domain_repo/category_repository.dart';
import 'package:clean_archi/domain/entities/category_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;
  CategoryRepositoryImpl({required this.categoryDataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCatigories() async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {
        List<CategoryModel> categoryModel =
            await categoryDataSource.getCategories();
        List<CategoryEntity> categoryEntity =
            categoryModel.map((e) => e.toEntity()).toList();
        return Right(categoryEntity);
      } catch (e) {
        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
