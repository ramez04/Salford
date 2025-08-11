import 'dart:convert';

import 'package:clean_archi/data/data_source/course%20data%20source/course_data_course.dart';
import 'package:clean_archi/data/model/course_model.dart';
import 'package:dio/dio.dart' as dio;

final baseURL = "http://10.227.245.200:3000/";

class CoursesDataSourceImpl implements CoursesDataSource {
  @override
  Future<List<CoursesModel>> getCourses() async {
    List<CoursesModel> coursesModel = [];
    dio.Response response = await dio.Dio().get("${baseURL}api/course/getAll");
    List decodedData = jsonDecode(jsonEncode(response.data));
    coursesModel = decodedData.map((e) => CoursesModel.fromJson(e)).toList();
    return coursesModel;
  }
}
