import 'package:clean_archi/data/model/course_model.dart';

abstract class CoursesDataSource {
  Future<List<CoursesModel>> getCourses();
}
