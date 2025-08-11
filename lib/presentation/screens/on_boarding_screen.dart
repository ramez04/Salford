import 'package:clean_archi/presentation/controller/on_boarding_controller.dart';
import 'package:clean_archi/presentation/widgets/button.dart';
import 'package:clean_archi/presentation/widgets/grey_text.dart';
import 'package:clean_archi/presentation/widgets/light_black_text.dart';
import 'package:clean_archi/presentation/widgets/thick_blue_text.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> map = [
      {
        "text1": "Explore a wide range of",
        "text2": "IT Courses",
        "text3": "From coding to cybersecurity, we have it all!",
      },
      {
        "text1": "Learn on your own",
        "text2": "Schedule",
        "text3": "Access courses on the go, anytime, from anywhere.",
      },
      {
        "text1": "Ready to dive into ",
        "text2": "Learning?",
        "text3": "Access courses on the go, anytime, from anywhere.",
      },
    ];
    return GetBuilder<OnBoardingController>(
      builder: (con) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,

          body: Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: con.pageController.value,
                      itemCount: 3,
                      onPageChanged: (v) {},
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "${AppImages.obImages}${index + 1}.png",
                              ),
                              LightBlackText(text: map[index]["text1"]!),
                              ThickBlueText(text: map[index]["text2"]!),
                              GreyText(text: map[index]["text3"]!),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  !con.showButton.value
                      ? Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              con.skip();
                            },
                            child: LightBlackText(text: "Skip", fontSize: 20),
                          ),
                          Spacer(),
                          Icon(
                            Icons.circle,
                            size: 15,
                            color:
                                con.index.value % 3 == 0
                                    ? AppColors.mainColorDarker
                                    : AppColors.mainColorLighter,
                          ),
                          Icon(
                            Icons.circle,
                            size: 15,
                            color:
                                con.index.value % 3 == 1
                                    ? AppColors.mainColorDarker
                                    : AppColors.mainColorLighter,
                          ),
                          Icon(
                            Icons.circle,
                            size: 15,
                            color:
                                con.index.value % 3 == 2
                                    ? AppColors.mainColorDarker
                                    : AppColors.mainColorLighter,
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              con.nextPage();
                            },
                            child: LightBlackText(
                              text: "Next",
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                      : GestureDetector(
                        onTap: () {
                          con.skip();
                        },
                        child: Button(text: "Start Learning"),
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
