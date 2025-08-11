import 'package:clean_archi/presentation/controller/new/history_contoller.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryContoller());
  }
}
