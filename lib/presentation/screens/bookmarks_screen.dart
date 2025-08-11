import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:clean_archi/presentation/controller/bookmarks_controller.dart';
import 'package:clean_archi/presentation/widgets/course_view.dart';
import 'package:clean_archi/presentation/widgets/top_bar.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarksController>(
      builder: (con) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                SizedBox(height: 10),
                TopBar(title: "Bookmarks"),
                if (con.courses.isEmpty) ...[
                  Spacer(),
                  Text(
                    textAlign: TextAlign.center,
                    "You havent added anything to your bookmarks",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Spacer(),
                ],
                if (con.courses.isNotEmpty)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 16,
                        children: List.generate(con.courses.length, (index) {
                          CoursesEntity coursesEntity = con.courses[index];
                          return CourseView(
                            width: AppGeneral.width,
                            coursesEntity: coursesEntity,
                            con: con,
                          );
                        }),
                      ),
                    ),
                  ),
                SizedBox(height: 10),
              ],
            );
          }),
        );
      },
    );
  }
}
