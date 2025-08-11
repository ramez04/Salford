import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CoursesRepository {
  Future<Either<Failure, List<CoursesEntity>>> getCourses();
}
