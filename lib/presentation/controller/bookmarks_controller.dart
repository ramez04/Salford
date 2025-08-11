import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:clean_archi/presentation/widgets/button.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BookmarksController extends GetxController {
  RxList courses = [].obs;

  @override
  void onInit() {
    courses.value = GetStorage().read("bookmarks") ?? [];
    super.onInit();
  }

  Future<void> removeCourse(CoursesEntity course) async {
    courses.remove(course);
    await GetStorage().remove("bookmarks");
    GetStorage().write("bookmarks", courses);
  }

  Future<bool> confirmRemove(BuildContext context) async {
    bool remove = false;
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: AppGeneral.width! * .8,
              height: AppGeneral.height! * .2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Are you sure you want to remove this course",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          remove = true;
                          Get.back();
                        },
                        child: Button(
                          height: 40,
                          text: "Remove",
                          width: (AppGeneral.width! * .8 - 20) / 2.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          remove = false;
                          Get.back();
                        },
                        child: Button(
                          height: 40,

                          text: "Cancel",
                          width: (AppGeneral.width! * .8 - 20) / 2.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return remove;
  }
}
