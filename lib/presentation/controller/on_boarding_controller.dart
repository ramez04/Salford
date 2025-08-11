
import 'package:clean_archi/domain/usecases/user/get_user_by_id.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController().obs;
  RxInt index = 0.obs;
  RxBool showButton = false.obs;

  Future<void> nextPage() async {
    if (index.value < 2) {
      index.value += 1;
      pageController.value.nextPage(
        duration: Duration(milliseconds: 750),
        curve: Curves.linear,
      );
      if (index.value == 2) {
        await Future.delayed(Duration(milliseconds: 500));
        showButton.value = true;
      }
    } else {
      skip();
    }
  }

  Future<void> skip() async {
    String? id = GetStorage().read("id");
    if (id != null && id.isNotEmpty) {
      final getUserController = Get.find<GetUserUsingId>();
      final result = await getUserController.call(id);
      result.fold(
        (failure) {
          Get.offAndToNamed(RouteStrings.login);
        },
        (userEntity) {
          AppGeneral.userEntity = userEntity;
          Get.toNamed(RouteStrings.home);
        },
      );
    } else {
      Get.toNamed(RouteStrings.login);
    }
  }

  @override
  void onInit() {
    index.value = 0;
    super.onInit();
  }
}
