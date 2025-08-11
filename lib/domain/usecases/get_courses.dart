import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/domain_repo/courses_repository.dart';
import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:dartz/dartz.dart';

class GetCourses {
  final CoursesRepository repositiry;

  GetCourses({required this.repositiry});

  Future<Either<Failure, List<CoursesEntity>>> call() async {
    var result = await repositiry.getCourses();
    return result;
  }
}
