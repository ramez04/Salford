import 'dart:developer';

import 'package:clean_archi/domain/entities/auth_entity.dart';
import 'package:clean_archi/domain/usecases/user/get_user.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  RxBool obsecure = true.obs;
  RxBool rememberMe = false.obs;
  @override
  void onInit() {
    email.value.text = Get.arguments ?? "";
    super.onInit();
  }

  void toggleObsecure() {
    obsecure.value = !obsecure.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> login() async {
    if (email.value.text.isNotEmpty && password.value.text.isNotEmpty) {
      try {
        AuthEntity authEntity = AuthEntity(
          email: email.value.text,
          password: password.value.text,
        );
        final getUser = Get.find<GetUser>();
        var res = await getUser.call(authEntity);
        res.fold(
          (failure) {
            Get.snackbar("Sorry", failure.message!);
          },
          (userEntity) {
            if (rememberMe.value) {
              log("remember me id${userEntity.email} + ${userEntity.id}");
              GetStorage().write("id", userEntity.id);
            }
            log("heloo  ${userEntity.id}");
            AppGeneral.userEntity = userEntity;
            Get.offAndToNamed(RouteStrings.home);
          },
        );
      } catch (e) {
        Get.snackbar("Error", "$e While creating account");
      }
    } else {
      Get.snackbar(
        "Sorry",
        "All fields must be filled",
        backgroundColor: Colors.white,
      );
    }
  }
}
