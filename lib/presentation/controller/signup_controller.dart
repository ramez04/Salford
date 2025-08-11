
import 'package:clean_archi/domain/entities/auth_entity.dart';
import 'package:clean_archi/domain/usecases/user/add_user.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final confirmPassword = TextEditingController().obs;

  RxBool obsecure = true.obs;

  void toggleObsecure() {
    obsecure.value = !obsecure.value;
  }

  @override
  void onInit() {
    email.value.text = Get.arguments ?? "";
    super.onInit();
  }

  Future<void> signup() async {
    if (email.value.text.isNotEmpty &&
        confirmPassword.value.text.isNotEmpty &&
        password.value.text.isNotEmpty) {
      if (confirmPassword.value.text == password.value.text) {
        // final authController = Get.find<Signup>();
        // AuthEntity auth = AuthEntity(
        //   email: email.value.text,
        //   password: password.value.text,
        // );
        // final authResult = await authController.call(auth);
        // authResult.fold(
        //   (Failure f) {
        //     Get.snackbar("Error", "${f.message} While creating account");
        //   },
        //   (UserCredential credentials) async {
        //     final userController = Get.find<AddUser>();
        //     UserEntity user = UserEntity(
        //       name: "",
        //       id: credentials.user!.uid,
        //       email: email.value.text,
        //       paymentMethod: "",
        //       image: "",
        //     );
        //     final addUserResult = await userController.call(user);
        //     addUserResult.fold(
        //       (Failure f) {
        //         Get.snackbar("Sorry", "${f.message} While creating account");
        //       },
        //       (r) {
        //         AppGeneral.userEntity = user;
        //         Get.offAndToNamed(RouteStrings.home);
        //       },
        //     );
        //   },
        // );
        final addUser = Get.find<AddUser>();
        AuthEntity auth = AuthEntity(
          email: email.value.text,
          password: password.value.text,
        );
        final result = await addUser.call(auth);
        result.fold(
          (failure) {
            Get.snackbar("Sorry", "${failure.message}");
          },
          (userEntity) {
            AppGeneral.userEntity = userEntity;
            Get.snackbar("Horrayy...", "Created account successfully");
            Get.offAndToNamed(RouteStrings.home);
          },
        );
      } else {
        Get.snackbar(
          "Sorry",
          "Passwords don't match",
          backgroundColor: Colors.white,
        );
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
