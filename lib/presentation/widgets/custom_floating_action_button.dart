import 'package:clean_archi/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, this.con});

  // ignore: prefer_typing_uninitialized_variables
  final con;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          con.toogleMenu();
        },
        child: AnimatedRotation(
          turns: con.menu.value ? 0.25 / 2 : 0,
          duration: Duration(milliseconds: 500),
          child: Container(
            decoration: BoxDecoration(
              color: !con.menu.value ? AppColors.mainColorDarker : Colors.white,
              shape: BoxShape.circle,
            ),
            width: 85,
            height: 85,
            child: Center(
              child: Icon(
                Icons.add,
                color: con.menu.value ? Colors.black : Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
