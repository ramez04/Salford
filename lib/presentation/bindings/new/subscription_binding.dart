import 'package:clean_archi/presentation/controller/new/subscription_controller.dart';
import 'package:get/get.dart';

class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionController());
  }
}
