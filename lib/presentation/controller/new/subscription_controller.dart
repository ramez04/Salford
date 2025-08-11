import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  RxString sub = "Premium".obs;

  void toggle(String subSelection) {
    sub.value = subSelection;
  }
}
