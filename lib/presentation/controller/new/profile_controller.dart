import 'dart:developer';

import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:clean_archi/domain/usecases/add_user_image.dart';
import 'package:clean_archi/domain/usecases/user/update_user.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  Rx<UserEntity?> user = AppGeneral.userEntity.obs;
  RxBool menu = false.obs;
  void toogleMenu() {
    menu.value = !menu.value;
  }

  Future<void> addImage() async {
    final addImageController = Get.find<AddUserImage>();
    final updateUser = Get.find<UpdateUser>();
    await Permission.storage.request();
    if (!(await Permission.storage.request()).isDenied) {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        var result = await addImageController.call(image);
        result.fold(
          (failure) {
            Get.snackbar("Sorry", failure.message.toString());
          },
          (path) async {
            user.value!.image = path;
            var result2 = await updateUser.call(user.value!);
            result2.fold(
              (failure) {
                Get.snackbar("Sorry", failure.message.toString());
              },
              (userEntity) {
                log("udpated $userEntity");
                user.value = userEntity;
                Get.snackbar("Yayyy..", "Updated profile image succesfully");
              },
            );
          },
        );
      } else {
        return;
      }
    }
  }

  @override
  void onClose() {
    AppGeneral.userEntity = user.value!;

    super.onClose();
  }
}
