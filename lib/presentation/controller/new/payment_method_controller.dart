import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:clean_archi/domain/usecases/user/update_user.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardHolderName = TextEditingController();
  TextEditingController cvv = TextEditingController();
  Rx<TextEditingController> expiryDate = TextEditingController().obs;

  void onChanged() {
    if (expiryDate.value.text.length == 1 &&
        int.parse(expiryDate.value.text.substring(0, 1)) > 1) {
      expiryDate.value.text = '0${expiryDate.value.text.substring(0, 1)}';
    }
    if (int.parse(expiryDate.value.text.substring(0, 1)) == 0 &&
        expiryDate.value.text.length == 1) {
      expiryDate.value.text = "";
    }
  }

  Future<void> addPaymentMethod() async {
    final userController = Get.find<UpdateUser>();
    AppGeneral.userEntity.paymentMethod = PaymentMethodEntity(
      holderName: cardHolderName.value.text,
      number: cardNumber.value.text,
      cvv: cvv.value.text,
      expiryDate: expiryDate.value.text,
    );
    final res = await userController.call(AppGeneral.userEntity);
    res.fold(
      (failure) {
        // Get.snackbar("Sorry", "Failed to add payment method");
      },
      (userEntity) {
        Get.snackbar("Added", "");
        AppGeneral.userEntity = userEntity;
      },
    );
  }
}
