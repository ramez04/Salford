
import 'package:clean_archi/core/error/connection_failure.dart';
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/core/error/unexpected_failure.dart';
import 'package:clean_archi/data/data_source/course%20data%20source/course_data_course.dart';
import 'package:clean_archi/data/model/course_model.dart';
import 'package:clean_archi/domain/domain_repo/courses_repository.dart';
import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesDataSource coursesDataSource;

  CoursesRepositoryImpl({required this.coursesDataSource});
  @override
  Future<Either<Failure, List<CoursesEntity>>> getCourses() async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {
        List<CoursesModel> coursesModel = await coursesDataSource.getCourses();
        List<CoursesEntity> coursesEntity =
            coursesModel.map((e) => e.toEntity()).toList();
        return Right(coursesEntity);
      } catch (e) {
        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
