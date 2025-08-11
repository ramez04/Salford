import 'package:clean_archi/presentation/controller/splash_controller.dart';
import 'package:clean_archi/presentation/widgets/circle.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (con) {
        AppGeneral.width = MediaQuery.sizeOf(context).width;
        AppGeneral.height = MediaQuery.sizeOf(context).height;
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,

          body: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 100,
                left: 0,
                right: 0,
                child: Center(child: Image.asset(AppImages.logo, scale: 1.4)),
              ),
              Positioned(
                bottom: -250,
                left: -60,
                right: -60,
                child: Circle(
                  color: AppColors.mainColorLighter,
                  widget: Center(
                    child: Circle(
                      color: AppColors.mainColor,
                      widget: Center(
                        child: Circle(
                          color: AppColors.mainColorDarker,
                          widget: SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
