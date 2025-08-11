import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CourseDetailsController extends GetxController {
  CoursesEntity arg = Get.arguments;
  RxBool menu = false.obs;

  @override
  void onInit() {
    List history = GetStorage().read("history") ?? [];
    if (history.isEmpty) {
      GetStorage().write("history", [arg]);
    } else {
      GetStorage().write("history", [...history, arg]);
    }
    super.onInit();
  }

  void toogleMenu() {
    menu.value = !menu.value;
  }

  void addCourse(CoursesEntity courseEntity) {
    if (GetStorage().read("myCourses") == null) {
      GetStorage().write("myCourses", [courseEntity]);
    } else {
      List<CoursesEntity> courses = GetStorage().read("myCourses");
      if (courses.contains(courseEntity)) {
        Get.snackbar(
          "Opps...",
          "This course is already added to your courses",
          backgroundColor: Colors.white,
          duration: Duration(seconds: 1),
        );
        return;
      } else {
        courses.add(courseEntity);
        GetStorage().remove("myCourses");
        GetStorage().write("myCourses", courses);
      }
    }
    Get.snackbar(
      "Nice",
      "You added a course",
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 750),
    );
  }
}
