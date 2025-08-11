import 'package:clean_archi/presentation/controller/course_details_controller.dart';
import 'package:get/get.dart';

class CourseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseDetailsController());
  }
}
