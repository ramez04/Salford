import 'package:clean_archi/presentation/controller/new/view_all_courses_in_section_controller.dart';
import 'package:get/get.dart';

class ViewAllCoursesInSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewAllCoursesInSectionController());
  }
}
