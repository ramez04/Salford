import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryContoller extends GetxController {
  RxList courses = [].obs;
  RxBool foundCourses = false.obs;
  @override
  Future<void> onInit() async {
    courses.value = GetStorage().read("history") ?? [];

    super.onInit();
  }
}
