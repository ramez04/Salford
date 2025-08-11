import 'package:clean_archi/presentation/controller/bookmarks_controller.dart';
import 'package:get/get.dart';

class BookmarksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookmarksController());
  }
}
