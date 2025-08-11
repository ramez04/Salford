import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Center(child: Icon(Icons.arrow_back_ios_new)),
      ),
    );
  }
}
