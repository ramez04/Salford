import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:clean_archi/presentation/controller/new/history_contoller.dart';
import 'package:clean_archi/presentation/widgets/top_bar.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryContoller>(
      builder: (con) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SizedBox(
            width: AppGeneral.width,
            height: AppGeneral.height,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Obx(() {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20,
                  children: [
                    SizedBox(height: 10),
                    TopBar(title: "History"),

                    if (con.courses.isNotEmpty)
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 16,
                            children: List.generate(con.courses.length, (
                              index,
                            ) {
                              CoursesEntity coursesEntity =
                                  con.courses[con.courses.length - 1 - index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    RouteStrings.courseDetails,
                                    arguments: coursesEntity,
                                  );
                                },
                                child: Container(
                                  width: AppGeneral.width,
                                  height: 150,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: (AppGeneral.width! - 24) * .4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(coursesEntity.name),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "By: ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors
                                                              .mainColorDarker,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: coursesEntity.tutor,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (coursesEntity.lessons != 0)
                                                  Image.asset(AppImages.book),
                                                if (coursesEntity.lessons != 0)
                                                  Text(
                                                    " ${coursesEntity.lessons} Lessons ",
                                                  ),
                                              ],
                                            ),
                                            if (coursesEntity.chapters != 0)
                                              Text(
                                                " ${coursesEntity.chapters} Chapters",
                                              ),
                                          ],
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          width: (AppGeneral.width! - 24) * .5,
                                          imageUrl: coursesEntity.image,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
