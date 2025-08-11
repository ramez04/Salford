import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:clean_archi/presentation/controller/course_details_controller.dart';
import 'package:clean_archi/presentation/widgets/button.dart';
import 'package:clean_archi/presentation/widgets/custom_floating_action_button.dart';
import 'package:clean_archi/presentation/widgets/menu.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseDetailsController>(
      builder: (con) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,

          floatingActionButton: CustomFloatingActionButton(con: con),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SizedBox(
            width: AppGeneral.width,
            height: AppGeneral.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          (con.arg.image.isNotEmpty
                              ? CachedNetworkImage(
                                imageUrl: con.arg.image,
                                width: AppGeneral.width,
                                height: AppGeneral.height! * .3,
                                fit: BoxFit.cover,
                              )
                              : SizedBox()),

                          Positioned(top: 30, left: 20, child: BackButton()),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (con.arg.lessons != 0)
                                  Image.asset(AppImages.book),
                                if (con.arg.lessons != 0)
                                  Text(" ${con.arg.lessons} Lessons "),
                                if (con.arg.lessons != 0 &&
                                    con.arg.chapters != 0)
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                if (con.arg.chapters != 0)
                                  Text(" ${con.arg.chapters} Chapters"),
                              ],
                            ),
                            if (con.arg.name.isNotEmpty)
                              Text(
                                con.arg.name,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (con.arg.description.isNotEmpty)
                              SizedBox(height: 20),
                            if (con.arg.description.isNotEmpty)
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            SizedBox(height: 5),
                            if (con.arg.description.isNotEmpty)
                              Text(
                                con.arg.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            SizedBox(height: 30),
                            Column(
                              spacing: 16,
                              children: List.generate(con.arg.lessonPlan.length, (
                                index,
                              ) {
                                LessonPlanEntity lessonPlanEntity =
                                    con.arg.lessonPlan[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          AppColors.mainColorDarker,
                                      child: Center(
                                        child: Image.asset(
                                          AppImages.book,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Week ${lessonPlanEntity.begin}-${lessonPlanEntity.end}:",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppGeneral.width! * .7,
                                          child: Text(
                                            lessonPlanEntity.objective,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                con.addCourse(con.arg);
                              },
                              child: Button(
                                width: AppGeneral.width,
                                text: "Add course to my courses",
                              ),
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Menu(con: con, page: "").build(context),
              ],
            ),
          ),
        );
      },
    );
  }
}
