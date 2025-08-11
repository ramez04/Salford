import 'package:clean_archi/presentation/widgets/button.dart';
import 'package:clean_archi/presentation/widgets/grey_text.dart';
import 'package:clean_archi/presentation/widgets/light_black_text.dart';
import 'package:clean_archi/presentation/widgets/thick_blue_text.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.welcomeImage),
            Spacer(flex: 2),
            LightBlackText(text: "Welcome to"),
            ThickBlueText(text: "SALFORD"),
            GreyText(
              text: "Unlock the best IT courses for your career growth.",
            ),
            Spacer(flex: 1),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteStrings.onBoarding);
              },
              child: Button(text: "Get started"),
            ),
            Spacer(flex: 3),

            Row(),
          ],
        ),
      ),
    );
  }
}
